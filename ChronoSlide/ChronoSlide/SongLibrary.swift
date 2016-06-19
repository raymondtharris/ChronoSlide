//
//  SongLibrary.swift
//  ChronoSlide
//
//  Created by Tim Harris on 6/15/16.
//  Copyright © 2016 Tim Harris. All rights reserved.
//

import Foundation
import MediaPlayer

let allSongs = MPMediaQuery.songs().items!

class SongLibrary {
    
    
    class func getSongs(_ withLowerBound: Int, andUpperBound: Int) -> [MPMediaItem] {
        print("\(withLowerBound) \(andUpperBound)")
        
        var buffLowerIndex = withLowerBound - 7
        var buffUpperIndex = withLowerBound
        var songsPre = Array<MPMediaItem>(allSongs[buffLowerIndex..<buffUpperIndex]) as [MPMediaItem]
        //print(songsPre)
        var songs:[MPMediaItem] = Array<MPMediaItem>(allSongs[withLowerBound..<andUpperBound]) as [MPMediaItem]
        
        //songs.append(contentsOf: Array<MPMediaItem>(allSongs[withLowerBound..<andUpperBound]) as [MPMediaItem])
        //print(songs.count)
        //print( MPMediaQuery.songsQuery().items![withLowerBound..<andUpperBound])
       // var temp = MPMediaQuery.songsQuery().items![withLowerBound..<andUpperBound]
        //print(temp)
//        for anItem in MPMediaQuery.songs().items![withLowerBound..<andUpperBound] {
//           // print("1")
//            songs.append(anItem)
//        }
    
        return songs
    }
    class func getSongsB(_ withLowerBound: Int, andUpperBound: Int) -> [MPMediaItem] {
        print("\(withLowerBound) \(andUpperBound)")
        let buffLowerIndex = withLowerBound - 7
        let buffUpperIndex = withLowerBound
        var songsPre = Array<MPMediaItem>(allSongs[buffLowerIndex..<buffUpperIndex]) as [MPMediaItem]
        songsPre.append(contentsOf: Array<MPMediaItem>(allSongs[withLowerBound..<andUpperBound]) as [MPMediaItem])
        let songs:[MPMediaItem] = songsPre
        
        print(songs.count)
        //DispatchQueue.main().sync() {
            //print(
            //songs = Array<MPMediaItem>(MPMediaQuery.songs().items![withLowerBound..<andUpperBound]) as [MPMediaItem]
          //  }
        
        //print(temp)
        
        
        return songs
    }
}
