//
//  MovieDetailsViewController.swift
//  iMovieDB
//
//  Created by Danilo on 17/01/2019.
//  Copyright © 2019 Danilo Bias. All rights reserved.
//

import UIKit

let offset_HeaderStop:CGFloat = 100.0 // At this offset the Header stops its transformations
let offset_B_LabelHeader:CGFloat = 95.0 // At this offset the Black label reaches the Header
let distance_W_LabelHeader:CGFloat = 30.0 // The distance between the bottom of the Header and the top of the White Label


class MovieDetailsViewController: BaseViewController {
    
    // MARK: - IBOutlet's
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var headerBlurImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Let's and Var's
    var blurredHeaderImageView: UIImageView?
    
    var moviesByGenre: MovieByGenre?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.contentInset = UIEdgeInsets(top: header.frame.height, left: 0, bottom: 0, right: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.configureHeaderLayout()
        self.showMovieDetails()
    }
    
    // MARK: - Layout config
    func configureHeaderLayout() {

        // Header - Image
        self.headerImageView = UIImageView(frame: self.header.bounds)
        self.headerImageView?.image = UIImage(named: "header_bg")
        self.headerImageView?.contentMode = .scaleAspectFill
        self.header.insertSubview(self.headerImageView, belowSubview: self.headerLabel)
        
        // Header - Blurred Image
        self.headerBlurImageView = UIImageView(frame: self.header.bounds)
//        headerBlurImageView?.image = UIImage(named: "header_bg")?.blurredImage(withRadius: 10, iterations: 20, tintColor: UIColor.clear)
        self.headerImageView?.image = UIImage(named: "header_bg")
        self.headerBlurImageView?.contentMode = .scaleAspectFill
        self.headerBlurImageView?.alpha = 0.0
        self.headerBlurImageView.addBlurEffect()
        self.header.insertSubview(self.headerBlurImageView, belowSubview:self.headerLabel)
        self.header.clipsToBounds = true
        
//        self.view.bringSubviewToFront(self.scrollView)
    }
    
    func showMovieDetails() {
        let movieTitle: String = self.moviesByGenre?.originalTitle ?? ""
        self.titleLabel.text = movieTitle
        self.headerLabel.text = movieTitle
        
        let placeholderImage = UIImage(named: "ic_claquete_large")!

        if let url = URL(string: self.moviesByGenre?.posterFullUrl ?? "") {
            self.avatarImage.kf.setImage(with: url, placeholder: placeholderImage)
        }
        
        if let coverUrl = URL(string: self.moviesByGenre?.backdropFullUrl ?? "") {
            self.headerImageView.kf.setImage(with: coverUrl, placeholder: placeholderImage)
        }
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

extension MovieDetailsViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       
//        let offset = scrollView.contentOffset.y + header.bounds.height
//        var avatarTransform = CATransform3DIdentity
//        var headerTransform = CATransform3DIdentity
//
//        // PULL DOWN -----------------
//
//        if offset < 0 {
//            print("SUBIU \(self.header.bounds.height)")
//            let headerScaleFactor:CGFloat = -(offset) / self.header.bounds.height
//            let headerSizevariation = ((self.header.bounds.height * (1.0 + headerScaleFactor)) - self.header.bounds.height)/2.0
//            headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0)
//            headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0)
//
//            self.header.layer.transform = headerTransform
//        }
//
//            // SCROLL UP/DOWN ------------
//
//        else {
//
//            // Header -----------
//            print("DESCEU")
//            headerTransform = CATransform3DTranslate(headerTransform, 0, max(-offset_HeaderStop, -offset), 0)
//
//            //  ------------ Label
//
//            let labelTransform = CATransform3DMakeTranslation(0, max(-distance_W_LabelHeader, offset_B_LabelHeader - offset), 0)
//            headerLabel.layer.transform = labelTransform
//
//            //  ------------ Blur
//
//            headerBlurImageView?.alpha = min (1.0, (offset - offset_B_LabelHeader)/distance_W_LabelHeader)
//
//            // Avatar -----------
//
//            let avatarScaleFactor = (min(offset_HeaderStop, offset)) / self.avatarImage.bounds.height / 1.4 // Slow down the animation
//            let avatarSizeVariation = ((self.avatarImage.bounds.height * (1.0 + avatarScaleFactor)) - self.avatarImage.bounds.height) / 2.0
//            avatarTransform = CATransform3DTranslate(avatarTransform, 0, avatarSizeVariation, 0)
//            avatarTransform = CATransform3DScale(avatarTransform, 1.0 - avatarScaleFactor, 1.0 - avatarScaleFactor, 0)
//
//            if offset <= offset_HeaderStop {
//
//                if self.avatarImage.layer.zPosition < self.header.layer.zPosition{
//                    self.header.layer.zPosition = 0
//                }
//
//            }else {
//                if self.avatarImage.layer.zPosition >= self.header.layer.zPosition{
//                    self.header.layer.zPosition = 2
//                }
//            }
//        }
//
//        // Apply Transformations
//
//        self.header.layer.transform = headerTransform
//        self.avatarImage.layer.transform = avatarTransform
        
        let offset = scrollView.contentOffset.y + header.bounds.height

        var avatarTransform = CATransform3DIdentity
        var headerTransform = CATransform3DIdentity

        // PULL DOWN -----------------

        if offset < 0 {

            let headerScaleFactor:CGFloat = -(offset) / header.bounds.height
            let headerSizevariation = ((header.bounds.height * (1.0 + headerScaleFactor)) - header.bounds.height)/2
            headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0)
            headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0)


            // Hide views if scrolled super fast
            header.layer.zPosition = 0
            headerLabel.isHidden = true

        }

            // SCROLL UP/DOWN ------------

        else {

            // Header -----------

            headerTransform = CATransform3DTranslate(headerTransform, 0, max(-offset_HeaderStop, -offset), 0)

            //  ------------ Label

            headerLabel.isHidden = false
            let alignToNameLabel = -offset + titleLabel.frame.origin.y + header.frame.height + offset_HeaderStop

            headerLabel.frame.origin = CGPoint(x: headerLabel.frame.origin.x, y: max(alignToNameLabel, distance_W_LabelHeader + offset_HeaderStop))


            //  ------------ Blur

            headerBlurImageView?.alpha = min (1.0, (offset - alignToNameLabel)/distance_W_LabelHeader)

            // Avatar -----------

            let avatarScaleFactor = (min(offset_HeaderStop, offset)) / avatarImage.bounds.height / 4.4 // Slow down the animation
            print(avatarScaleFactor)

            let avatarSizeVariation = ((avatarImage.bounds.height * (1.0 + avatarScaleFactor)) - avatarImage.bounds.height) / 2.0
            print(avatarSizeVariation)

            avatarTransform = CATransform3DTranslate(avatarTransform, 0, avatarSizeVariation, 0)
            avatarTransform = CATransform3DScale(avatarTransform, 1.0 - avatarScaleFactor, 1.0 - avatarScaleFactor, 0)

            if offset <= offset_HeaderStop {

                if avatarImage.layer.zPosition < header.layer.zPosition{
                    header.layer.zPosition = 0
                }


            }else {
                if avatarImage.layer.zPosition >= header.layer.zPosition{
                    header.layer.zPosition = 2
                }

            }

        }

        // Apply Transformations
        header.layer.transform = headerTransform
        avatarImage.layer.transform = avatarTransform
    }
}
