

import UIKit

// 相当于数据模型model
class itemsModel: NSObject {
     
    var cover_image_url = ""
    var title  = ""
    var likecount = ""
     
}

var url = URL(string: "https://hr.nju.edu.cn/")!
var request = URLRequest(url: url)
var conf = URLSessionConfiguration.default
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
   
    var dataArray1:Array<String>?
    var titleArray:[String]?
    var imageArray:[UIImageView] = []
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
         request.httpMethod = "GET"
        
        
        for _ in 0...3
        {
            imageArray.append(UIImageView(image: UIImage(named: "fire")))
            
        }

        
        dataArray1 = Array<String>()
        for _ in 0...3 {
            dataArray1?.append("Label")
        }
        titleArray = ["人事通知","人事新闻","公示公告","招聘信息"]
        let tableView = UITableView(frame: self.view.frame, style: .grouped)
        //注册cell
//        tableView.register(UINib.init(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCellId")
        tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "TableViewCellId")
        self.view.addSubview(tableView)
        //设置数据源与代理
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.isEditing = true
    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    //设置列表有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray1!.count
    }
    //设置每行数据的数据载体Cell视图
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //获取到载体Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath)
        cell.textLabel?.text = dataArray1![indexPath.row]
//        let model = dataArray1![indexPath.row]
//         cell.accessoryView = imageArray[indexPath.row]

//        //对cell进行设置
//        cell.contentView = imageArray[indexPath.row]
//        cell.iconView.image =
        //        //对cell进行设置]
//        cell.proTitle.text = model.name
//        cell.proDetail.text = model.subTitle
//        cell.price.text = model.price
        return cell
    }
    //设置列表的分区数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    //设置索引栏标题
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return titleArray!
    }
    //设置分区头部标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleArray![section]
    }
    //这个方法将索引栏上的文字与具体的分区进行绑定
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    
//   //返回每行Cell的编辑模式
//    public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle{
//        if indexPath.row==0 {
//            return .insert
//        }else{
//            return .delete
//        }
//
//    }
//    //设置显示的交互按钮的文字
//    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String?{
//        if indexPath.row==0 {
//            return "插入"
//        }else{
//            return "删除"
//        }
//    }
//    //点击交互按钮后回回调的方法
//    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
//        //根据编辑模式做不同的逻辑处理
//        if editingStyle==UITableViewCell.EditingStyle.delete {
//            print("点击了删除按钮")
//            //先删除数据源中此条数据
//            dataArray?.remove(at: indexPath.row)
//            //从界面上删除此条Cell
//            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
//        }else{
//            //先向数据源中插入一条数据
//            let pro1 = Product()
//            pro1.imageName = "productImage"
//            pro1.name = "杜康酒1500ml罐装"
//            pro1.subTitle = "    何以解忧，唯有杜康。纯粮食酿造，国庆大酬宾。"
//            pro1.price = "60元"
//            dataArray?.insert(pro1, at: indexPath.row)
//            //在向界面中插入一条Cell
//            tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.fade)
//            print("点击了插入按钮")
//        }
//    }
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
//        //修改数据源
//        let tmp = dataArray![sourceIndexPath.row]
//        let tmp2 = dataArray![destinationIndexPath.row]
//        dataArray![sourceIndexPath.row] = tmp2
//        dataArray![destinationIndexPath.row] = tmp
//    }
//
//
//    //设置分区头部标题
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "我是分区头部"
//    }
//    //设置分区尾部标题
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "我是分区尾部"
//    }
//
//    //设置分区的头部视图
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 120))
//        view.backgroundColor = UIColor.red
//        return view
//    }
//    //设置分区的尾部视图
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
//        view.backgroundColor = UIColor.green
//        return view
//    }
//    //设置分区头部视图高度
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 120
//    }
//    //设置分区的尾部视图高度
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 50
//    }
    
    
    
//    func parseHRFile() {
//           do {
//       if let htmlDocument = htmlDocument {
//           print("parsing html")
//           let els: Elements = try htmlDocument.getElementsByClass("news_list")
//           var index = 0
//           for section:Element in els.array() {
//               let titleElements = try section.getElementsByClass("news_title")
//               let dateElements = try section.getElementsByClass("news_meta")
//               let readNumElements = try section.getElementsByClass("news_meta1")
//               var titles = [String]()
//               var dates = [String]()
//               var readNums = [String]()
//               var urls = [String]()
//               for titleElement in  titleElements {
//                   var title = try titleElement.child(0).attr("title")
//                   var url = try titleElement.child(0).attr("href")
//                   titles.append(title)
//                   urls.append(url)
//               }
//               for dateElement in dateElements {
//                   dates.append(try dateElement.text())
//               }
//               for readNumElement in readNumElements {
//                   readNums.append(try readNumElement.text())
//               }
//
//               pageInfo.addSection(titles,dates,readNums,urls, to:index)
//               index += 1
//               //pageInfo.addRecord(recordText, toSection:pageInfo.hrNotifications)
//           }
//           print("parse Done")
//           self.tableView.reloadData()
//       }
//   } catch Exception.Error(let type, let message){
//       print(message)
//   } catch {
//       print("error")
//   }
//       }
//
    
//
//    @IBOutlet weak var gifttableview: UITableView!
//
//    // 数据源
//    var dataArray = [itemsModel]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        gifttableview.delegate = self
//        gifttableview.dataSource = self
//
//        self.DownLoadData()
//
//        // Do any additional setup after loading the view.
//
//    }
//
//    // MARK: 下载解析数据
//    func DownLoadData() -> Void {
//
//        Alamofire.request(.GET, "http://api.liwushuo.com/v2/channels/104/items?ad=2&gender=2&generation=2&limit=20&offset=0").responseJSON {
//            (response)   in
//
//            // 有错误就打印错误，没有就解析数据
//            if let Error = response.result.error
//            {
//               print(Error)
//            }
//            else if let jsonresult = response.result.value {
//                // 用 SwiftyJSON 解析数据
//                let JSOnDictory = JSON(jsonresult )
//                let data =  JSOnDictory["data"]["items"].array
//                for dataDic in  data!
//                {
//
//                    let model =  itemsModel()
//                    //  ?? 这个符号，我怕有初学者忘记了的提醒一下，A ?? B  这是一个 NIL合并运算符，它的作用是如果 A 不是NIL 就返回前面可选类型参数 A 的确定值， 如果 A 是NIL 就返回后面 B 的值！A和B之间类型的注意点我就不说了，忘记了去看书，，哈哈哈
//
//                    model.cover_image_url = dataDic["cover_image_url"].string ?? ""
//                    model.title =  dataDic["title"].string ?? ""
//
//                    let  numString = String(format:"%d",dataDic["likes_count"].intValue ?? 0)
//                    model.likecount = numString
//                    self.dataArray.append(model)
//
//                }
//
//                self.gifttableview.reloadData()
//
//                //print(jsonresult)
//
//            }
//        }
//    }
//
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return self.dataArray.count
//
//    }
//
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//
//        let cell:giftTabelViewcell = tableView .dequeueReusableCellWithIdentifier("Gifsayidentifile") as! giftTabelViewcell
//        let model = self.dataArray[indexPath.row]
//        cell.likeNumberLabel.text = model.likecount
//
//        // 这个就是用到 Kingfisher
//        cell.backGroundImage.kf_setImageWithURL(NSURL(string: model.cover_image_url)!)
//        return cell
//
//    }
//
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//
//        print(indexPath.row)
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
    }
    


// func parseHRFile() {
//        do {
//            if let htmlDocument = htmlDocument {
//                print("parsing html")
//                let els: Elements = try htmlDocument.getElementsByClass("news_list")
//                var index = 0
//                for section:Element in els.array() {
//                    let titleElements = try section.getElementsByClass("news_title")
//                    //print(record)
//                    //print(titles)
//                    let dateElements = try section.getElementsByClass("news_meta")
//                    let readNumElements = try section.getElementsByClass("news_meta1")
//
//                    var titles = [String]()
//                    var dates = [String]()
//                    var readNums = [String]()
//                    var urls = [String]()
//                    for titleElement in  titleElements {
//                        var title = try titleElement.child(0).attr("title")
//                        var url = try titleElement.child(0).attr("href")
//                        titles.append(title)
//                        urls.append(url)
//                    }
//                    for dateElement in dateElements {
//                        dates.append(try dateElement.text())
//                    }
//                    for readNumElement in readNumElements {
//                        readNums.append(try readNumElement.text())
//                    }
//
//                    pageInfo.addSection(titles,dates,readNums,urls, to:index)
//                    index += 1
//                    //pageInfo.addRecord(recordText, toSection:pageInfo.hrNotifications)
//                }
//                print("parse Done")
//                self.tableView.reloadData()
//            }
//        } catch Exception.Error(let type, let message){
//            print(message)
//        } catch {
//            print("error")
//        }
//    }
//    
//}


//
//class giftSaycontroller: UIViewController {
//
//
//
//}
//
