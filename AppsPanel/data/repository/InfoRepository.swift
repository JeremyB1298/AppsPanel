//
//  InfoRepository.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

class InfoRepository {
    
    private var apiService: ApiService
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    func retrieveData(completion: @escaping ((String?) -> Void)) {
        self.apiService.request(fromURLString: ApiValues.INFOS_URL, headers: ["X-AP-Key":"uD4Muli8nO6nzkSlsNM3d1Pm", "X-AP-DeviceUID":"trial", "Accept":"text/html"]) { result in
            switch result {
            case .success(let data):
                completion(String(decoding: data, as: UTF8.self))
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
