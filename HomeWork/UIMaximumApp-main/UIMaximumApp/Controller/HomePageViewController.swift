import UIKit

class HomePageViewController: UIViewController, UIScrollViewDelegate {
    
    let scrollViewHeight : CGFloat = 4600
    
    var menuCollectionView: UICollectionView?
    var magazalarCollectionView: UICollectionView?
    var modaFirsatlariCollectionView: UICollectionView?
    var cepTelefonuCollectionView: UICollectionView?
    var telefonAksesuariCollectionView: UICollectionView?
    
    let contentView = UIView()
    let scrollView = UIScrollView()
    let searchBar = UISearchBar()
    let scrollContentview = UIView()
    let populerMagazalarLabel = UILabel()
    let modaFirsatlariLabel = UILabel()
    let cepTelefonlariLabel = UILabel()
    let telefonAksesuarlariLabel = UILabel()
    let superSaatlerImage = UIImageView()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        /*
         setupMenuCollectionView()
         setupMagazaCollectionView()
         setupModaFirsatlariCollectionView()
         setupCepTelefonuCollectionView()
         */
    }
}

//  MARK: VIEW SETUP
extension HomePageViewController {
    private func setupView() {
        scrollView.delegate = self
        view.backgroundColor = .white
        
        
        
        //        MARK: - Pink ContentView
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .appPink
        //        contentView.layer.cornerRadius = 10.0
        
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        
        
        //        MARK: - SearchBar
        contentView.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Marka, ürün veya hizmet arayın"
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.backgroundColor = .white
        
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)
        ])
        
        let cameraImage = UIImageView()
        searchBar.addSubview(cameraImage)
        cameraImage.image = UIImage(named: "photo-camera")
        cameraImage.translatesAutoresizingMaskIntoConstraints = false
        cameraImage.contentMode = .scaleAspectFit
        
        
        NSLayoutConstraint.activate([
            cameraImage.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            cameraImage.rightAnchor.constraint(equalTo: searchBar.rightAnchor, constant: -20),
            cameraImage.widthAnchor.constraint(equalToConstant: 20),
            cameraImage.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        
        
        //        MARK: - Bildirim resmi
        let notificationImage = UIImageView()
        notificationImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(notificationImage)
        notificationImage.image = UIImage(named: "notice1")
        notificationImage.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            notificationImage.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            notificationImage.widthAnchor.constraint(equalToConstant: 25),
            notificationImage.heightAnchor.constraint(equalToConstant: 25),
            notificationImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
        
        
        
        //        MARK: - ScrollView
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.bounces = false
        scrollView.delegate = self
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        
        scrollContentview.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(scrollContentview)
        
        
        NSLayoutConstraint.activate([
            scrollContentview.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContentview.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContentview.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContentview.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollContentview.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            scrollContentview.heightAnchor.constraint(equalToConstant: scrollViewHeight)
        ])
        
        
        let pinkContentView = UIView(frame: CGRect(x: 50, y: 50, width: UIScreen.main.bounds.width, height: 200))
        pinkContentView.backgroundColor = .appPink
        scrollContentview.addSubview(pinkContentView)
        pinkContentView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let bottomLeftRadius : CGFloat = 10.0
        let bottomRightRadius : CGFloat = 10.0
        
        let maskLayer = CAShapeLayer()
        
        let path = UIBezierPath(roundedRect: pinkContentView.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: bottomLeftRadius, height: bottomRightRadius))
        maskLayer.path = path.cgPath
        
        pinkContentView.layer.mask = maskLayer
        
        
        NSLayoutConstraint.activate([
            pinkContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            pinkContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            pinkContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            pinkContentView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        
        
        
        
        //        MARK: - Navbar Resmi
        let navbarImage = UIImageView()
        navbarImage.translatesAutoresizingMaskIntoConstraints = false
        navbarImage.image = UIImage(named: "navbar")
        scrollContentview.addSubview(navbarImage)
        navbarImage.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            navbarImage.topAnchor.constraint(equalTo: scrollContentview.topAnchor, constant: 5),
            navbarImage.leftAnchor.constraint(equalTo: scrollContentview.leftAnchor, constant: 15),
            navbarImage.widthAnchor.constraint(equalToConstant: 30),
            navbarImage.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
        
        
        //       MARK: - Maximum Logo
        let maximumLogo = UIImageView()
        maximumLogo.translatesAutoresizingMaskIntoConstraints = false
        maximumLogo.image = UIImage(named: "maximumwhite")
        scrollContentview.addSubview(maximumLogo)
        maximumLogo.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            maximumLogo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            maximumLogo.topAnchor.constraint(equalTo: navbarImage.topAnchor),
            maximumLogo.widthAnchor.constraint(equalToConstant: 100),
            maximumLogo.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
        
        /*
         
         
         //        MARK: - StackView & ContentView
         
         // 1. View - Kartlarım View
         let kartlarimView = UIView()
         contentView.addSubview(kartlarimView)
         kartlarimView.backgroundColor = UIColor.white
         kartlarimView.translatesAutoresizingMaskIntoConstraints = false
         kartlarimView.layer.cornerRadius = 6
         
         NSLayoutConstraint.activate([
         kartlarimView.topAnchor.constraint(equalTo: navbarImage.bottomAnchor, constant: 10),
         kartlarimView.leftAnchor.constraint(equalTo: navbarImage.leftAnchor, constant: 5),
         kartlarimView.widthAnchor.constraint(equalToConstant: 85),
         kartlarimView.heightAnchor.constraint(equalToConstant: 80)
         ])
         
         //        Cards Imageview
         let cardsImage = UIImageView()
         cardsImage.image = UIImage(named: "payment")
         kartlarimView.addSubview(cardsImage)
         cardsImage.contentMode = .scaleAspectFit
         cardsImage.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
         cardsImage.topAnchor.constraint(equalTo: kartlarimView.topAnchor, constant: 10),
         cardsImage.centerXAnchor.constraint(equalTo: kartlarimView.centerXAnchor),
         cardsImage.widthAnchor.constraint(equalToConstant: 40),
         cardsImage.heightAnchor.constraint(equalToConstant: 40)
         ])
         
         //        Cards Label
         let kartlarimLabel = UILabel()
         kartlarimLabel.text = "Kartlarım"
         kartlarimView.addSubview(kartlarimLabel)
         kartlarimLabel.font = UIFont(name: "Arial", size: 12)
         kartlarimLabel.textColor = .appPink
         kartlarimLabel.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
         kartlarimLabel.topAnchor.constraint(equalTo: cardsImage.bottomAnchor, constant: 1),
         kartlarimLabel.centerXAnchor.constraint(equalTo: kartlarimView.centerXAnchor),
         kartlarimLabel.bottomAnchor.constraint(equalTo: kartlarimView.bottomAnchor, constant: -3)
         ])
         
         
         // 2. View - Kampanyalar View
         let kampanyalarView = UIView()
         contentView.addSubview(kampanyalarView)
         kampanyalarView.backgroundColor = UIColor.white
         kampanyalarView.translatesAutoresizingMaskIntoConstraints = false
         kampanyalarView.layer.cornerRadius = 6
         
         NSLayoutConstraint.activate([
         kampanyalarView.topAnchor.constraint(equalTo: kartlarimView.topAnchor),
         kampanyalarView.leftAnchor.constraint(equalTo: kartlarimView.rightAnchor, constant: 12),
         kampanyalarView.widthAnchor.constraint(equalToConstant: 85),
         kampanyalarView.heightAnchor.constraint(equalToConstant: 80)
         ])
         
         
         //        Kampanyalar Imageview
         let offerImage = UIImageView()
         offerImage.image = UIImage(named: "maximumTab")
         kampanyalarView.addSubview(offerImage)
         offerImage.contentMode = .scaleAspectFit
         offerImage.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
         offerImage.topAnchor.constraint(equalTo: kampanyalarView.topAnchor, constant: 10),
         offerImage.centerXAnchor.constraint(equalTo: kampanyalarView.centerXAnchor),
         offerImage.widthAnchor.constraint(equalToConstant: 40),
         offerImage.heightAnchor.constraint(equalToConstant: 40)
         ])
         
         //        Kampanyalar Label
         let offerLabel = UILabel()
         offerLabel.text = "Kampanyalar"
         kampanyalarView.addSubview(offerLabel)
         offerLabel.font = UIFont(name: "Arial", size: 12)
         offerLabel.textColor = .appPink
         offerLabel.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
         offerLabel.topAnchor.constraint(equalTo: offerImage.bottomAnchor, constant: 1),
         offerLabel.centerXAnchor.constraint(equalTo: kampanyalarView.centerXAnchor),
         offerLabel.bottomAnchor.constraint(equalTo: kampanyalarView.bottomAnchor, constant: -3)
         ])
         
         
         // 3. View - Para Gönder View
         let moneyTransferView = UIView()
         contentView.addSubview(moneyTransferView)
         moneyTransferView.backgroundColor = UIColor.white
         moneyTransferView.translatesAutoresizingMaskIntoConstraints = false
         moneyTransferView.layer.cornerRadius = 6
         
         NSLayoutConstraint.activate([
         moneyTransferView.topAnchor.constraint(equalTo: kartlarimView.topAnchor),
         moneyTransferView.leftAnchor.constraint(equalTo: kampanyalarView.rightAnchor, constant: 12),
         moneyTransferView.widthAnchor.constraint(equalToConstant: 85),
         moneyTransferView.heightAnchor.constraint(equalToConstant: 80)
         ])
         
         //        Para Gönder Imageview
         let mnyTransferImage = UIImageView()
         mnyTransferImage.image = UIImage(named: "transfer")
         moneyTransferView.addSubview(mnyTransferImage)
         mnyTransferImage.contentMode = .scaleAspectFit
         mnyTransferImage.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
         mnyTransferImage.topAnchor.constraint(equalTo: moneyTransferView.topAnchor, constant: 10),
         mnyTransferImage.centerXAnchor.constraint(equalTo: moneyTransferView.centerXAnchor),
         mnyTransferImage.widthAnchor.constraint(equalToConstant: 40),
         mnyTransferImage.heightAnchor.constraint(equalToConstant: 40)
         ])
         
         //        Para Gönder Label
         let mnyTransferLabel = UILabel()
         mnyTransferLabel.text = "Para Gönder"
         moneyTransferView.addSubview(mnyTransferLabel)
         mnyTransferLabel.font = UIFont(name: "Arial", size: 12)
         mnyTransferLabel.textColor = .appPink
         mnyTransferLabel.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
         mnyTransferLabel.topAnchor.constraint(equalTo: mnyTransferImage.bottomAnchor, constant: 1),
         mnyTransferLabel.centerXAnchor.constraint(equalTo: moneyTransferView.centerXAnchor),
         mnyTransferLabel.bottomAnchor.constraint(equalTo: moneyTransferView.bottomAnchor, constant: -3)
         ])
         
         
         
         // 4. View - MTV Öde View
         let mtvView = UIView()
         contentView.addSubview(mtvView)
         mtvView.backgroundColor = UIColor.white
         mtvView.translatesAutoresizingMaskIntoConstraints = false
         mtvView.layer.cornerRadius = 6
         
         NSLayoutConstraint.activate([
         mtvView.topAnchor.constraint(equalTo: kartlarimView.topAnchor),
         mtvView.leftAnchor.constraint(equalTo: moneyTransferView.rightAnchor, constant: 12),
         mtvView.widthAnchor.constraint(equalToConstant: 85),
         mtvView.heightAnchor.constraint(equalToConstant: 80)
         ])
         
         
         //        MTV Öde Imageview
         let mtvOdeImage = UIImageView()
         mtvOdeImage.image = UIImage(named: "toll")
         mtvView.addSubview(mtvOdeImage)
         mtvOdeImage.contentMode = .scaleAspectFit
         mtvOdeImage.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
         mtvOdeImage.topAnchor.constraint(equalTo: mtvView.topAnchor, constant: 5),
         mtvOdeImage.centerXAnchor.constraint(equalTo: mtvView.centerXAnchor),
         mtvOdeImage.widthAnchor.constraint(equalToConstant: 40),
         mtvOdeImage.heightAnchor.constraint(equalToConstant: 40)
         ])
         
         //        Para Gönder Label
         let mtvOdeLabel = UILabel()
         mtvOdeLabel.text = "MTV Öde"
         mtvView.addSubview(mtvOdeLabel)
         mtvOdeLabel.font = UIFont(name: "Arial", size: 12)
         mtvOdeLabel.textColor = .appPink
         mtvOdeLabel.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
         mtvOdeLabel.topAnchor.constraint(equalTo: mtvOdeImage.bottomAnchor, constant: 1),
         mtvOdeLabel.centerXAnchor.constraint(equalTo: mtvView.centerXAnchor),
         mtvOdeLabel.bottomAnchor.constraint(equalTo: mtvView.bottomAnchor, constant: -3)
         ])
         
         
         //        Aşağı Yönlü Ok
         let arrowImage = UIImageView()
         arrowImage.image = UIImage(named: "arrow")
         contentView.addSubview(arrowImage)
         arrowImage.translatesAutoresizingMaskIntoConstraints = false
         arrowImage.contentMode = .scaleAspectFit
         
         NSLayoutConstraint.activate([
         arrowImage.topAnchor.constraint(equalTo: kampanyalarView.bottomAnchor, constant: 10),
         arrowImage.widthAnchor.constraint(equalToConstant: 30),
         arrowImage.heightAnchor.constraint(equalToConstant: 30),
         arrowImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
         arrowImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1)
         ])
         
         
         
         
         //        MARK: - Pazarama Logo
         let logoPazarama = UIImageView()
         logoPazarama.image = UIImage(named: "pazaramaLogo")
         logoPazarama.translatesAutoresizingMaskIntoConstraints = false
         logoPazarama.contentMode = .scaleAspectFit
         view.addSubview(logoPazarama)
         
         NSLayoutConstraint.activate([
         logoPazarama.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -60),
         logoPazarama.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
         logoPazarama.widthAnchor.constraint(equalToConstant: 170),
         logoPazarama.heightAnchor.constraint(equalToConstant: 170)
         ])
         
         
         
         
         
         
         
         
         //        MARK: Pazarama Puanlarim
         let pazaramaPuanlarimButton = DefaultButton(frame: .zero, image: UIImage(named: "pazaramaPuanim")!, cornerRadius: 5)
         scrollContentview.addSubview(pazaramaPuanlarimButton)
         NSLayoutConstraint.activate([
         pazaramaPuanlarimButton.topAnchor.constraint(equalTo: scrollContentview.topAnchor, constant: 358),
         pazaramaPuanlarimButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
         pazaramaPuanlarimButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
         pazaramaPuanlarimButton.heightAnchor.constraint(equalToConstant: 40),
         ])
         
         
         
         //        MARK: - Süper Saatler Foto
         
         superSaatlerImage.image = UIImage(named: "superSaatler")
         superSaatlerImage.translatesAutoresizingMaskIntoConstraints = false
         superSaatlerImage.contentMode = .scaleAspectFit
         scrollContentview.addSubview(superSaatlerImage)
         
         NSLayoutConstraint.activate([
         superSaatlerImage.topAnchor.constraint(equalTo: pazaramaPuanlarimButton.bottomAnchor, constant: 15),
         superSaatlerImage.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20),
         superSaatlerImage.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -10),
         superSaatlerImage.heightAnchor.constraint(equalToConstant: 210)
         ])
         
         
         
         // MARK: - Popüler Mağazalar UILabel
         scrollContentview.addSubview(populerMagazalarLabel)
         populerMagazalarLabel.translatesAutoresizingMaskIntoConstraints = false
         populerMagazalarLabel.text = "Popüler Mağazalar"
         populerMagazalarLabel.font = UIFont(name: "Times New Roman", size: 25)
         populerMagazalarLabel.textColor = .black
         NSLayoutConstraint.activate([
         populerMagazalarLabel.topAnchor.constraint(equalTo: superSaatlerImage.bottomAnchor, constant: 10),
         populerMagazalarLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
         populerMagazalarLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
         ])
         
         
         
         
         // MARK: - Moda Fırsatları UILabel
         scrollContentview.addSubview(modaFirsatlariLabel)
         modaFirsatlariLabel.translatesAutoresizingMaskIntoConstraints = false
         modaFirsatlariLabel.text = "Moda Fırsatları"
         modaFirsatlariLabel.font = UIFont(name: "Times New Roman", size: 20)
         modaFirsatlariLabel.textColor = .black
         NSLayoutConstraint.activate([
         modaFirsatlariLabel.topAnchor.constraint(equalTo: populerMagazalarLabel.bottomAnchor, constant: 100),
         modaFirsatlariLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
         modaFirsatlariLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
         ])
         
         
         
         
         // MARK: - Kampanya1 UIButton
         let kampanya1 = DefaultButton(frame: .zero, image: UIImage(named: "offer1")!, cornerRadius: 10)
         scrollContentview.addSubview(kampanya1)
         NSLayoutConstraint.activate([
         kampanya1.topAnchor.constraint(equalTo: modaFirsatlariLabel.bottomAnchor, constant: 450),
         kampanya1.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
         kampanya1.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
         kampanya1.heightAnchor.constraint(equalToConstant: 210),
         ])
         
         // MARK: - Kampanya2 UIButton
         let kampanya2 = createKampanya(image: UIImage(named: "offer2")!, y: kampanya1.bottomAnchor)
         
         // MARK: - Kampanya3 UIButton
         let kampanya3 = createKampanya(image: UIImage(named: "offer3")!, y: kampanya2.bottomAnchor)
         
         // MARK: - Kampanya4 UIButton
         let kampanya4 = createKampanya(image: UIImage(named: "offer4")!, y: kampanya3.bottomAnchor)
         
         // MARK: - Kampanya5 UIButton
         let kampanya5 = createKampanya(image: UIImage(named: "offer5")!, y: kampanya4.bottomAnchor)
         
         // MARK: - Kampanya6 UIButton
         let kampanya6 = createKampanya(image: UIImage(named: "offer6")!, y: kampanya5.bottomAnchor)
         
         // MARK: - Kampanya7 UIButton
         let kampanya7 = createKampanya(image: UIImage(named: "offer7")!, y: kampanya6.bottomAnchor)
         
         // MARK: - Kampanya8 UIButton
         let kampanya8 = createKampanya(image: UIImage(named: "offer8")!, y: kampanya7.bottomAnchor)
         
         
         
         // MARK: - Cep Telefonları UILabel
         scrollContentview.addSubview(cepTelefonlariLabel)
         cepTelefonlariLabel.translatesAutoresizingMaskIntoConstraints = false
         cepTelefonlariLabel.text = "Cep Telefonu Fırsatları"
         cepTelefonlariLabel.font = UIFont(name: "Times New Roman", size: 20)
         cepTelefonlariLabel.textColor = .black
         NSLayoutConstraint.activate([
         cepTelefonlariLabel.topAnchor.constraint(equalTo: kampanya8.bottomAnchor, constant: 20),
         cepTelefonlariLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
         cepTelefonlariLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
         ])
         
         // MARK: - Kampanya9 UIButton
         let kampanya9 = DefaultButton(frame: .zero, image: UIImage(named: "offer9")!, cornerRadius: 10)
         scrollContentview.addSubview(kampanya9)
         NSLayoutConstraint.activate([
         kampanya9.topAnchor.constraint(equalTo: cepTelefonlariLabel.bottomAnchor, constant: 220),
         kampanya9.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
         kampanya9.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
         kampanya9.heightAnchor.constraint(equalToConstant: 210),
         ])
         
         // MARK: - Kampanya10 UIButton
         let kampanya10 = createKampanya(image: UIImage(named: "offer10")!, y: kampanya9.bottomAnchor)
         
         // MARK: - Kampanya11 UIButton
         let kampanya11 = createKampanya(image: UIImage(named: "offer11")!, y: kampanya10.bottomAnchor)
         
         // MARK: - Telefon Aksesuarları UILabel
         scrollContentview.addSubview(telefonAksesuarlariLabel)
         telefonAksesuarlariLabel.translatesAutoresizingMaskIntoConstraints = false
         telefonAksesuarlariLabel.text = "Telefon Aksesuarları"
         telefonAksesuarlariLabel.font = UIFont(name: "Times New Roman", size: 20)
         telefonAksesuarlariLabel.textColor = .black
         NSLayoutConstraint.activate([
         telefonAksesuarlariLabel.topAnchor.constraint(equalTo: kampanya11.bottomAnchor, constant: 20),
         telefonAksesuarlariLabel.leftAnchor.constraint(equalTo: scrollContentview.leftAnchor, constant: 20),
         telefonAksesuarlariLabel.rightAnchor.constraint(equalTo: scrollContentview.rightAnchor, constant: -10),
         ])
         
         
         // MARK: - Kampanya12 UIButton
         let kampanya12 = DefaultButton(frame: .zero, image: UIImage(named: "offer12")!, cornerRadius: 10)
         scrollContentview.addSubview(kampanya12)
         NSLayoutConstraint.activate([
         kampanya12.topAnchor.constraint(equalTo: telefonAksesuarlariLabel.bottomAnchor, constant: 20),
         kampanya12.leftAnchor.constraint(equalTo: scrollContentview.leftAnchor, constant: 20),
         kampanya12.rightAnchor.constraint(equalTo: scrollContentview.rightAnchor, constant: -10),
         kampanya12.heightAnchor.constraint(equalToConstant: 210),
         ])
         
         // MARK: - Kampanya13 UIButton
         let kampanya13 = createKampanya(image: UIImage(named: "offer13")!, y: kampanya12.bottomAnchor)
         
         // MARK: - Kampanya14 UIButton
         let _ = createKampanya(image: UIImage(named: "offer14")!, y: kampanya13.bottomAnchor)
         
         
         
         }
         
         
         
         private func createKampanya(image: UIImage, y: NSLayoutYAxisAnchor) -> DefaultButton{
         let kampanya = DefaultButton(frame: .zero, image: image, cornerRadius: 10)
         scrollContentview.addSubview(kampanya)
         NSLayoutConstraint.activate([
         kampanya.topAnchor.constraint(equalTo: y, constant: 10),
         kampanya.leftAnchor.constraint(equalTo: scrollContentview.leftAnchor, constant: 20),
         kampanya.rightAnchor.constraint(equalTo: scrollContentview.rightAnchor, constant: -10),
         kampanya.heightAnchor.constraint(equalToConstant: 210),
         ])
         return kampanya
         }
         */
        
        
    }
}

