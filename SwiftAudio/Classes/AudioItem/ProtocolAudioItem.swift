//
//  ProtocolAudioItem.swift
//  HSCPlayer
//
//  Created by HugoSilva on 3/15/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import UIKit
import AVFoundation

public enum SourceType {
    case stream
    case file
}

public protocol AudioItem: AnyObject {
    
    func getPosition() -> Int
    func getSongId() -> Int
    func getSongName() -> String
    func getCommentsCount() -> Int
    func getArtistName() -> String?
    func getArtistsMain() -> [ArtistPlayer]?
    func getArtistsFeature() -> [ArtistPlayer]?
    func getArtistsartistProducer() -> [ArtistPlayer]?
    func getAlbumPlayer() -> AlbumPlayer
    func getSourceUrl() -> String
    func getStreamOnly() -> Bool
    func getStoreUrl() -> String
    func getSourceType() -> SourceType
    func getImageUrl() -> String
    func getArtwork(_ handler: @escaping (UIImage?) -> Void)
   
}

/// Make your `AudioItem`-subclass conform to this protocol to control which AVAudioTimePitchAlgorithm is used for each item.
public protocol TimePitching : AnyObject{
    
    func getPitchAlgorithmType() -> AVAudioTimePitchAlgorithm
    
}

/// Make your `AudioItem`-subclass conform to this protocol to control enable the ability to start an item at a specific time of playback.
public protocol InitialTiming: AnyObject {
    func getInitialTime() -> TimeInterval
}

/// Make your `AudioItem`-subclass conform to this protocol to set initialization options for the asset. Available keys available at [Apple Developer Documentation](https://developer.apple.com/documentation/avfoundation/avurlasset/initialization_options).
public protocol AssetOptionsProviding: AnyObject {
    func getAssetOptions() -> [String: Any]
}
