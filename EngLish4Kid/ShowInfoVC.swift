//
//  ShowInfoVC.swift
//  EngLish4Kid
//
//  Created by Quan on 7/10/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class ShowInfoVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    var photo : [UIImageView] = []
    var first = false
    var numberOfImage : Int = 4

    override func viewDidLoad() {
        super.viewDidLoad()
        pageController.currentPage = 0
        pageController.numberOfPages = numberOfImage
        
    }
    
    override func viewDidLayoutSubviews() {
        if self.first == false {
            self.first = true
            let pageScrollViewSize = self.scrollView.bounds.size
            self.scrollView.contentSize = CGSizeMake(pageScrollViewSize.width *  CGFloat(numberOfImage), pageScrollViewSize.height)
            self.scrollView.contentOffset = CGPointMake(pageScrollViewSize.width * CGFloat(pageController.currentPage), 0)
            
            for (var i = 0; i <= numberOfImage; i++) {
                let imgName = self.title! + "\(i)" + ".jpg"
                let imgView = UIImageView(image: UIImage(named: imgName))
                imgView.frame = CGRectMake(0, 20, scrollView.bounds.size.width, scrollView.bounds.size.height)
                imgView.contentMode = .ScaleToFill
                photo.append(imgView)
                
                let frontScrollView = UIScrollView(frame: CGRect(x: CGFloat(i) * scrollView.bounds.size.width, y: 0, width: scrollView.bounds.size.width, height: scrollView.bounds.size.height))
                frontScrollView.backgroundColor = UIColor.blueColor()
                frontScrollView.maximumZoomScale = 2
                frontScrollView.minimumZoomScale = 0.5
                frontScrollView.delegate = self
                scrollView.addSubview(frontScrollView)
                frontScrollView.addSubview(imgView)
                
                print("\(imgView.bounds.size) -- \(frontScrollView.bounds.size)")
            
            }
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return photo[pageController.currentPage]
    }
    
    @IBAction func onChange(sender: AnyObject) {
        scrollView.contentOffset = CGPointMake(CGFloat(pageController.currentPage) * self.scrollView.bounds.size.width, 0)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        pageController.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
    }
    

}
