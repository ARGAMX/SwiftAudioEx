//
//  DefaultAudioItem.swift
//  HSCPlayer
//
//  Created by HugoSilva on 3/15/19.
//  Copyright © 2019 HugoSilva. All rights reserved.
//

import UIKit

public class DefaultAudioItem: AudioItem {

    public var position: Int
    public var songId: Int
    public var songName: String
    public var commentsCount: Int
    public var artistMain: [ArtistPlayer]?
    public var artistFeature:[ArtistPlayer]?
    public var artistProducer: [ArtistPlayer]?
    public var album: AlbumPlayer
    public var audioUrl: String
    public var streamOnly: Bool
    public var storeUrl: String
    public var sourceType: SourceType
    public var artwork = UIImageView()

    public init(position: Int, songId: Int, songName: String, commentsCount: Int, artistMain: [ArtistPlayer]?, artistFeature:[ArtistPlayer]?, artistProducer: [ArtistPlayer]?, album: AlbumPlayer, audioUrl: String, streamOnly: Bool, sourceType: SourceType, storeUrl: String) {
        self.position = position
        self.songId = songId
        self.songName = songName
        self.commentsCount = commentsCount
        self.artistMain = artistMain
        self.artistFeature = artistFeature
        self.artistProducer = artistProducer
        self.album = album
        self.audioUrl = audioUrl
        self.streamOnly = streamOnly
        self.sourceType = sourceType
        self.storeUrl = storeUrl
    }
  
    public func getPosition() -> Int {
        return position
    }
    
    public func getSongId() -> Int {
        return songId
    }
    
    public func getSongName() -> String {
        return songName
    }
    
    public func getCommentsCount() -> Int {
        return commentsCount
    }
    
    public func getArtistName() -> String? {
        return showArtists()
    }
    
    public func getArtistsMain() -> [ArtistPlayer]? {
        return artistMain
    }
    
    public func getArtistsFeature() -> [ArtistPlayer]? {
        return artistFeature
    }
    
    public func getArtistsartistProducer() -> [ArtistPlayer]? {
        return artistProducer
    }
    
    public func getAlbumPlayer() -> AlbumPlayer {
        return album
    }
   
    public func getSourceUrl() -> String {
        return audioUrl
    }
    
    public func getStreamOnly() -> Bool {
        return streamOnly
    }

    public func getStoreUrl() -> String {
        return storeUrl
    }
    
    public func getSourceType() -> SourceType {
        return sourceType
    }
    
    public func getImageUrl() -> String {
        return ImagesController.returnAppropriateImage(images: album.images.toImageList(), placeholder: "imgAlbumPlaceholder", type: .Medium)
    }
    
    public func getArtwork(_ handler: @escaping (UIImage?) -> Void) {
        artwork.setRemoteImage(withURL: URL(string: getImageUrl())!,
                               placeholder: UIImage(named: "imgAlbumPlaceholder"))
        handler(artwork.image)
    }
 
}

extension DefaultAudioItem {
    
    func showArtists() -> String{
        if let main = artistMain {
            if let firstName = main.first?.name {
                return firstName
            }
        }
        return ""
    }
  
}
