//
//  DataServices.swift
//  ShoeStore
//
//  Created by Claudia Maciel on 1/26/21.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    private let categories = [
        Category(title: "BOOTS", imageName: "Boots"),
        Category(title: "ACTIVE", imageName: "Active"),
        Category(title: "FORMAL", imageName: "Formal"),
        Category(title: "SANDALS", imageName: "Sandals"),
    ]
    
    private let boots = [
        Shoe(name: "Belgravia Boots", description: "Effortlessly stylish and perfect for the cooler months, our new knee-high boot Belgravia is your flexible friend. With a full-length inside zip for easy access and a large stretch panel for a comfortable fit, Belgravia offers superb support and ease of wear. In terms of stability, the rubber sole features a grippy cleated tread, whilst a breathable leather footbed with additional foam padding provides the all-important underfoot cushioning. Available in leather or nubuck, this versatile boot is finished with biker-style double buckles and metal zip detail.", price: 99, imageName: "Belgravia"),
        Shoe(name: "Whisper Boots", description: "Our bestselling and much-loved ankle boot, Whisper, is still the leader of the pack. Crafted with our lightweight Hotter Freesole provide high energy return to add more power to your walk and with a moulded OrthoLite® insole for supportive comfort, you will be walking on air with each step. With a mix of colours and materials, in leather, nubuck and suede options, you are spoilt for choice. Including double-zips for quick access and simple adjustability for your comfort, it is no wonder Whisper is our simple, stylish bestseller.", price: 139, imageName: "Whisper"),
        Shoe(name: "Sherbourne Boots", description: "Made from soft premium character leather this brand-new mid-height biker boot boasts super modern chic and fantastic comfort. Developed to include our latest Cushion+ design features, Sherbourne benefits from Hotter Freesole® with integrated Infinergy® inserts, and moulded OrthoLite® footbed which work in harmony to provide extra cushioned support and energy return into every step. The soft slouch leg with decorative strap and buckle detailing also features an inside zip for quick and easy on and off access.", price: 195, imageName: "Sherbourne")
        ]
    
    private let active = [
        Shoe(name: "Gravity II Shoes", description: "Our brand-new, next generation Gravity Active shoe features enhanced Cushion+ technology for increased comfort performance. The sporty Hotter Freesole profile features a unique flexible tread design and our new integrated Infinergy® inserts, which absorb pressure underfoot and energise your movement. Inside, the foam-backed soft textile lining works in harmony with the moulded OrthoLite® footbed to cushion and support your foot from all sides. The updated upper benefits from fully adustable laces, so you can enjoy the perfect bespoke fit every time.", price: 119, imageName: "Grvity"),
        Shoe(name: "Rutland GTX® Boots", description: "Tackle wet weather with ease in Rutland GTX®. These sturdy lace-up ankle boots provide excellent support around the ankle and underfoot thanks to soft cushioning and our signature flexible and durable sole. The Oil Aqua Nubuck upper is enhanced with Gore-Tex® product technology, which keeps rainwater out but allows inside moisture to escape; keeping feet dry, whatever the weather.", price: 195, imageName: "Rutland"),
        Shoe(name: "Mist GTX® Shoes ", description: "With integrated waterproof GORE-TEXÂ© product technology, Mist GTXÂ© is the ultimate everyday wet weather shoe. The grippy cleated sole with added traction control and stability has been upgraded to include Hotter Freesole rebound technology for enhanced walking motion and reduced to provide a secure bespoke fit.", price: 175, imageName: "Mist")
       ]
    
    private let formal = [
        Shoe(name: "Darcy Heels", description: "Radiating feminine charm and sophistication, Darcy has more than good looks on its side. The two-tone upper features a flattering T-bar design, with a delicate ankle strap that is fully adjustable thanks to a simple buckle fastening. The flexible rubber sole and low heel provides a firm footing and the cushioned insole ensures comfortable steps all day.", price: 45, imageName: "Darcy"),
        Shoe(name: "Amethyst Heels", description: "A brand-new addition to our heels collection, Amethyst is an updated and improved version of our much-loved Donna shoe. Featuring a sturdy low block heel for stability and breathable leather footbed with additional padding, you can step out feeling cool, confident and comfortable. The supportive high cut upper is crafted from luxurious soft suede and is embellished with a flattering soft twist detail to the front and subtle brogue detailing to the heel.", price: 155, imageName: "Amethyst"),
        Shoe(name: "Turn Shoes ", description: "Step out in style with Turn; a smart loafer in patent leather finishes. The elegant slip-on upper is created using a stitch and turn method of manufacture, making it super flexible and light. The foam-padded footbed and elastic stretch inserts provide flexible access and a comfortable fit every time. The lightweight and durable moulded sole also boasts excellent flexibility and stability.", price: 59, imageName: "Turn")
     ]
    
    private let sandals = [
        Shoe(name: "Resort Sandals", description: "Effortlessly stylish and versatile, Resort is a vacation suitcase essential. The classic toe-post design never goes out of style and pairs beautifully with everything from shorts to dresses. It also boasts hidden flexibility in the shape of a discreet elastic insert, and can be adjusted using the round buckle fastening. Extremely lightweight and deceptively flexible, the cushioned and contoured cork footbed features a lightly cleated rubber sole for enhanced durability.", price: 114, imageName: "Resort" ),
        Shoe(name: "Travel Sandals ", description: "Cushioned, durable and fully-adjustable, what's not to love about Travel? Offering three padded touch-close Velvet Nubuck straps with additional side panels for enhanced support around your foot, you'll feel completely secure from the moment you take your first step. The cushioned and contoured microfibre footbed forms part of the Tri-Density Comfort Sole, along with a lightweight midsole and rugged tread to help tackle rough terrain with ease.", price: 135, imageName: "Travel"),
        Shoe(name: "Flare Sandals", description: "Stand out and get noticed in Flare, a multi-strap leather sandal that flatters the foot and offers excellent adjustability and comfort. Two touch-close straps open fully for ease of access and can be altered to ensure that they are perfectly positioned to offer the correct support. With a flexible, durable sole and soft, cushioned microfibre insole; feel confident in every step you take in Flare.", price: 135, imageName: "Flare")
    ]
    
    func getCategories() -> [Category] {
        return categories
    }
    
    func getProducts(forCategoryTitle title: String) -> [Shoe] {
        switch title {
        case "BOOTS":
            return getBoots()
        case "ACTIVE":
            return getActive()
        case "FORMAL":
            return getFormal()
        case "SANDALS":
            return getSandals()
        default:
            return getBoots()
        }
        
    }
    
    func getBoots() -> [Shoe] {
        return boots
    }
    func getActive() -> [Shoe] {
        return active
    }
    func getFormal() -> [Shoe] {
        return formal
    }
    func getSandals() -> [Shoe] {
        return sandals
    }
    
}
