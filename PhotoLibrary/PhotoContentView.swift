//
//  ContentView.swift
//  PhotoLibrary
//
//  Created by Sumit on 31/07/24.
//

import SwiftUI
import PhotosUI

struct PhotoContentView: View {
    
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
   var body: some View {

      VStack(spacing:80) {
         VStack {
              selectedImage?
                   .resizable()
                   .frame(width:300,height:300)
           }
            .frame(width:300,height:300)
            .background(Rectangle()
            .fill(.gray))
            .cornerRadius(20)

            PhotosPicker("Select a Photo", selection: $pickerItem, matching: .images)
                .foregroundColor(.white)
                .padding([.all])
                .background(Color.red)
                .background(Rectangle())
                .cornerRadius(50)
                .shadow(radius: 20)
                .font(.system(size: 20, weight: .bold, design: .default))
            
           Spacer()
        }
        .padding()
        .onChange(of: pickerItem) {
           Task {
              selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
          }
       }
    }
 }

#Preview { PhotoContentView() }
