//
//  InfoViewModel.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

class InfoViewModel {
    
    private var infoRepository: InfoRepository
    
    init(infoRepository: InfoRepository) {
        self.infoRepository = infoRepository
    }
    
    func retrieveStringHtml(completion: @escaping ((String?) -> Void)) {
        self.infoRepository.retrieveData(completion: completion)
    }
    
}
