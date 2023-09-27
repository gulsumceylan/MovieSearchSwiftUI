//
//  CustomImage.swift
//  MovieSearchSwiftUI
//
//  Created by Gülsüm Ceylan on 27.09.2023.
//

import SwiftUI

struct CustomImage: View {
    let url : String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url: String) {
      self.url = url
      self.imageDownloaderClient.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageDownloaderClient.downloadedImage {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        } else {
            return Image("placeholder2")
                .resizable()
        }
    }
}

struct CustomImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomImage(url: "https://img.fruugo.com/product/6/31/14366316_max.jpg")
    }
}
