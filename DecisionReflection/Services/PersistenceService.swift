//
//  PersistenceService.swift
//  DecisionReflection
//
//  Local persistence service for decision sessions - privacy-first, no cloud sync.
//

import Foundation

class PersistenceService {

    static let shared = PersistenceService()

    private let fileManager = FileManager.default
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    private var storageURL: URL {
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("DecisionSessions")
    }

    private init() {
        encoder.dateEncodingStrategy = .iso8601
        decoder.dateDecodingStrategy = .iso8601
        createStorageDirectoryIfNeeded()
    }

    // MARK: - Public Methods

    func saveSession(_ session: DecisionSession) {
        let fileURL = storageURL.appendingPathComponent("\(session.id).json")

        do {
            let data = try encoder.encode(session)
            try data.write(to: fileURL, options: .atomic)
        } catch {
            print("Failed to save session: \(error.localizedDescription)")
        }
    }

    func loadSession(id: String) -> DecisionSession? {
        let fileURL = storageURL.appendingPathComponent("\(id).json")

        guard fileManager.fileExists(atPath: fileURL.path) else {
            return nil
        }

        do {
            let data = try Data(contentsOf: fileURL)
            return try decoder.decode(DecisionSession.self, from: data)
        } catch {
            print("Failed to load session: \(error.localizedDescription)")
            return nil
        }
    }

    func loadAllSessions() -> [DecisionSession] {
        guard let files = try? fileManager.contentsOfDirectory(at: storageURL, includingPropertiesForKeys: nil) else {
            return []
        }

        return files.compactMap { url in
            guard url.pathExtension == "json" else { return nil }

            do {
                let data = try Data(contentsOf: url)
                return try decoder.decode(DecisionSession.self, from: data)
            } catch {
                print("Failed to load session from \(url): \(error.localizedDescription)")
                return nil
            }
        }
    }

    func deleteSession(id: String) {
        let fileURL = storageURL.appendingPathComponent("\(id).json")

        do {
            try fileManager.removeItem(at: fileURL)
        } catch {
            print("Failed to delete session: \(error.localizedDescription)")
        }
    }

    func deleteAllSessions() {
        guard let files = try? fileManager.contentsOfDirectory(at: storageURL, includingPropertiesForKeys: nil) else {
            return
        }

        for file in files where file.pathExtension == "json" {
            try? fileManager.removeItem(at: file)
        }
    }

    // MARK: - Private Methods

    private func createStorageDirectoryIfNeeded() {
        if !fileManager.fileExists(atPath: storageURL.path) {
            try? fileManager.createDirectory(at: storageURL, withIntermediateDirectories: true)
        }
    }
}
