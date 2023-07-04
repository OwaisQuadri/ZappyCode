//
//  CourseTableViewController.swift
//  ZappyCode
//
//  Created by Quadri, Owais on 2023-07-04.
//

import UIKit
import Kingfisher

class CourseTableViewController: UITableViewController {
    var courses: [Course] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getCourses()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func getCourses() {
        guard let url = URL(string: "https://zappycode.com/api/courses") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        // URLSession: miniweb browser that actually uses internet to get data
        URLSession.shared.dataTask(with: request) {
            (data, response, err) in
                if err != nil {
                    print(err!.localizedDescription)
                } else if data != nil {
                    // print(String(data: data!, encoding: .utf8)!)
                    // decode data etc
                    if let coursesFromAPI = try? JSONDecoder().decode([Course].self, from: data!) {
                        DispatchQueue.main.async { // at the next possible time we can run on main =>
                            self.courses = coursesFromAPI
                            self.tableView.reloadData()
                        }
                    }
                }
            }.resume()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return courses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let course = courses[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell") as? CourseTableViewCell{
            cell.courseTitleLabel.text = course.title
            cell.courseSubtitleLabel.text = course.subtitle
            let url = URL(string: course.imgURLString)
            cell.courseImageView.kf.setImage(with: url)
            return cell
        }
        return UITableViewCell()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Actions
    @IBAction func reloadButtonTapped(_ sender: Any) {
        getCourses()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

     }
    */


}
