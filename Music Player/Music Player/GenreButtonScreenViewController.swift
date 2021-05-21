//
//  GenreButtonScreenViewController.swift
//  Music Player
//
//  Created by Richard Jacobs on 12/05/2021.
//

import UIKit
import MediaPlayer

class GenreButtonScreenViewController: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func genreButtonTapped(_ sender: UIButton) {
        
        MPMediaLibrary.requestAuthorization {(status) in
            if status == .authorized {
                self.PlayGenre(genre: sender.currentTitle!)
        }
    }
    }
    
   
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    func PlayGenre(genre: String) {
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with:query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
}
