//
//  EventsViewController.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

import UIKit


class EventsViewController: UIViewController {
    
    @IBOutlet weak var eventsTableView: UITableView!
    
    private var eventViewModel: EventViewModel!
    
    private var events: [Event]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupData()
    }
}

private extension EventsViewController {
    
    func setupData() {
        self.eventViewModel = EventViewModel(eventRepository: EventRepository(apiService: ApiService(), eventMapper: EventMapper()))
        self.eventViewModel.retrieveEvents { [weak self] events in
            self?.events = events
            DispatchQueue.main.async {
                self?.eventsTableView.reloadData()
            }
        }
    }
    
    func setupUI() {
        self.eventsTableView.dataSource = self
        self.eventsTableView.delegate = self
        self.eventsTableView.register(UINib(nibName: CellIdentifierValues.EVENT, bundle: nil), forCellReuseIdentifier: CellIdentifierValues.EVENT)
    }
}

extension EventsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifierValues.EVENT, for: indexPath) as? EventTableViewCell, let event = self.events?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.config(event: event)
        
        return cell
    }
}

extension EventsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as?  EventTableViewCell {
            let detailViewController = EventImageViewController(image: cell.imgView.image!)
            detailViewController.modalPresentationStyle = .fullScreen
            self.present(detailViewController, animated: true, completion: nil)
            
        }
    }
}
