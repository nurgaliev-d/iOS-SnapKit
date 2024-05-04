//
//  OnboardingViewController.swift
//  Ozinshe_SnapKit
//
//  Created by Диас Нургалиев on 08.04.2024.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    
    lazy var pgControl: UIPageControl = {
        let control = UIPageControl()
        control.currentPageIndicatorTintColor = UIColor(red: 179/255, green: 118/255, blue: 247/255, alpha: 1)
        control.pageIndicatorTintColor = UIColor(red: 209/255, green: 213/255, blue: 219/255, alpha: 1)
        control.numberOfPages = 3
        control.isEnabled = true
        
        return control
    }()
    
    var currentPage = 0 {
        didSet {
            pgControl.currentPage = currentPage
        }
    }
   private lazy var collView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .horizontal
       let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
       collectionView.isPagingEnabled = true
       collectionView.showsHorizontalScrollIndicator = false
       collectionView.backgroundColor = .systemBackground
       collectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: "Cell")
       
       
        return collectionView
    }()
    
    private let arraySlides = [
        ["firstSlide", "ÖZINŞE-ге қош келдің!", "Фильмдер, телехикаялар, ситкомдар, анимациялық жобалар, телебағдарламалар мен реалити-шоулар, аниме және тағы басқалары"],
        ["secondSlide", "ÖZINŞE-ге қош келдің!", "Кез келген құрылғыдан қара\nСүйікті фильміңді  қосымша төлемсіз телефоннан, планшеттен, ноутбуктан қара"],
        ["thirdSlide", "ÖZINŞE-ге қош келдің!", "Тіркелу оңай. Қазір тіркел де қалаған фильміңе қол жеткіз"]
    ]
    
    override func viewDidLoad() {
        collView.delegate = self
        collView.dataSource = self
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setupViews()
        setupConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        print(pgControl.currentPage)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
        navigationItem.title = " "
    }
    
    private func setupViews() {
        view.addSubview(collView)
        view.addSubview(pgControl)
    }
    
    private func setupConstraints() {
        collView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        pgControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(551)
        }
    }
    
    @objc func nextButtonTouched() {
        let signInVC = SignInViewController()
        navigationController?.show(signInVC, sender: self)
    }
    


}
//      MARK: CollectionView
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arraySlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! OnboardingCell
        cell.nextBtn.isHidden = indexPath.row != 2
        cell.contentMode = .scaleAspectFill
        cell.configure(with: arraySlides[indexPath.row])
        cell.nextButton.isHidden = indexPath.row == 2
        cell.nextButton.addTarget(self, action: #selector(nextButtonTouched), for: .touchUpInside)
        cell.nextBtn.addTarget(self, action: #selector(nextButtonTouched), for: .touchUpInside)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
//      MARK: Onoarding Cell-
class OnboardingCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 14)
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Өткізу", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    let nextBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Әрі қарай", for: .normal)
        button.backgroundColor = UIColor(red: 126/255, green: 45/255, blue: 252/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(nextButton)
        contentView.addSubview(nextBtn)
    }
    
    private func setupConstraints() {
        nextBtn.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().inset(72)
            make.height.equalTo(56)
        }
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
            make.bottom.equalToSuperview().inset(394)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(29)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(26)
            make.horizontalEdges.equalToSuperview().inset(32)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(imageView).inset(60)
            make.right.equalTo(imageView).inset(16)
            make.height.equalTo(24)
            make.width.equalTo(70)
        }
    }
    
    func configure(with data: [String]) {
        imageView.image = UIImage(named: data[0])
        titleLabel.text = data[1]
        descriptionLabel.text = data[2]
    }
}
