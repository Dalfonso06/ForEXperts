//
//  CryptoTableViewCell.swift
//  forEXperts
//
//  Created by Simon Bruce on 7/22/22.
//

import UIKit

class CryptoTableViewCellViewModel{
    let name: String
    let symbol: String
    let price: String
    let iconUrl: URL?
    var icondData: Data?
    
    init(name: String,
         symbol: String,
         price: String,
         iconUrl:URL?
        ){
        self.name = name
        self.symbol = symbol
        self.price  = price
        self.iconUrl = iconUrl
        
    }
}

class CryptoTableViewCell: UITableViewCell {

   static let identifer = "CryptoTableViewCell"
    
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    private let symbolLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    private let priceLabel: UILabel = {
       let label = UILabel()
        label.textColor = .systemGreen
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(symbolLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(iconImageView)
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size: CGFloat = contentView.frame.size.height/1.1
        
        iconImageView.frame = CGRect(x: 20,
                                 y:(contentView.frame.size.height-size)/2,
                                 width: size,
                                 height: size)
        
        nameLabel.sizeToFit()
        priceLabel.sizeToFit()
        symbolLabel.sizeToFit()
        
        nameLabel.frame = CGRect(x: 30 + size,
                                 y:0,
                                 width: contentView.frame.size.width/2,
                                 height: contentView.frame.size.height/2)
    
    
        symbolLabel.frame = CGRect(x: 30 + size,
                                   y:contentView.frame.size.height/2,
                                   width: contentView.frame.size.width/2,
                                   height: contentView.frame.size.height/2)
        
        priceLabel.frame = CGRect(x: contentView.frame.size.width/2,
                                  y:0,
                                  width: (contentView.frame.size.width/2)-15,
                                  height: contentView.frame.size.height/2)
}
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        nameLabel.text = nil
        priceLabel.text = nil
        symbolLabel.text = nil
    }
    
    func configure(with viewModel: CryptoTableViewCellViewModel){
        nameLabel.text = viewModel.name
        priceLabel.text = viewModel.price
        symbolLabel.text = viewModel.symbol
        
        if let data = viewModel.icondData{
            iconImageView.image = UIImage(data: data)
        } else if let url = viewModel.iconUrl {
            let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, _ in
                if let data = data {
                    viewModel.icondData = data
                    DispatchQueue.main.async {
                        self?.iconImageView.image = UIImage(data: data)
                    }
                }
            }
            
            task.resume()
        }
    }
    
}
