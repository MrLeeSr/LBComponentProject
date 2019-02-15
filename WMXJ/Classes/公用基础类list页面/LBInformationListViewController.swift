//
//  LBWmdjtViewController.swift
//  WMXJ
//
//  Created by 李斌 on 2019/1/7.
//  Copyright © 2019 com.njyl. All rights reserved.
//

import UIKit

class LBInformationListViewController: LBBaseViewController {
    
    let tabview = UITableView(frame: .zero, style: .grouped)
    
    var dataAry = NSArray()
    
    var titleStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpUI()
        
        self.loadData()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func setLBTitle(str:String){
        self.title = str
        
        if str == "理论e学"{
            let ary = [["img":"lilunexue1","name":"《习近平用典（第二辑）》  （人民日报评论部/著）","time":"2018.12.17","content":"党的十八大以来，习近平总书记发表的一系列重要讲话和文章中，精妙的典故信手拈来，广博的引用贯通古今。从这些用典中，既可以追溯习近平新时代中国特色社会主义思想的源头活水，又能在古为今用的创造性转化中感受中华优秀传统文化的博大精深。《习近平用典》第二辑沿用第一辑体例，收入习近平总书记近年来引用的，体现习近平新时代中国特色社会主义思想的典故148则，对其现实意义和背景义理进行解读、阐释，是一部学习领会习近平新时代中国特色社会主义思想的重要读本。 "],
                       ["img":"lilunexue2","name":"《学而时习之——读懂新时代的100个关键词》","time":"2018.12.15","content":"进入新时代，以习近平同志为核心的党中央深刻回答了新时代坚持和发展什么样的中国特色社会主义、怎样坚持和发展中国特色社会主义的重大时代课题，形成了一系列治国理政新理念、新思想、新战略，提出了“中国梦”“人类命运共同体”“一带一路”等带有鲜明中国特色与时代印记的关键词。本书选取了最重要的100个关键词，系统梳理了这些关键词背后“是什么”“为什么”“怎么办”等问题，旨在为党员干部深入学习贯彻党的十九大精神、深入学习领会习近平新时代中国特色社会主义思想提供有益参考。 "],
                       ["img":"lilunexue3","name":"《做一个思想清醒的人》 （黄相怀/著）","time":"2018.12.14","content":"本书首先对意识形态能力的重要性进行了介绍，然后分别从意识形态的鉴别力、学习力、思考力、创新力、表达力等五个角度，对党员干部如何提高意识形态能力进行了详细论述。全书语言通俗生动，引用大量案例，可读性强，是广大党员干部向党中央看齐、增强“四个意识”、避免陷入意识形态误区的优秀通俗读物。"]]
            self.dataAry = NSArray(array: ary)
        
            self.tabview.reloadData()
        }else if str == "创新创业"{
            let ary = [["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/5.png","name":"南京这个区因改革而富、因创新而强、因美丽而兴","time":"2018.12.17","content":"为庆祝改革开放40周年，我省组织“十县十镇十村十企调研行”活动。","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/5%E5%8D%97%E4%BA%AC%E8%BF%99%E4%B8%AA%E5%8C%BA%E5%9B%A0%E6%94%B9%E9%9D%A9%E8%80%8C%E5%AF%8C.png"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/7%E6%A0%87%E9%A2%98%E5%9B%BE.png","name":"《学而时习之——读懂新时代的100个关键词》","time":"2018.12.15","content":"进入新时代，以习近平同志为核心的党中央深刻回答了新时代坚持和发展什么样的中国特色社会主义、怎样坚持和发展中国特色社会主义的重大时代课题，形成了一系列治国理政新理念、新思想、新战略，提出了“中国梦”“人类命运共同体”“一带一路”等带有鲜明中国特色与时代印记的关键词。本书选取了最重要的100个关键词，系统梳理了这些关键词背后“是什么”“为什么”“怎么办”等问题，旨在为党员干部深入学习贯彻党的十九大精神、深入学习领会习近平新时代中国特色社会主义思想提供有益参考。","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/7%E9%A6%96%E5%B1%8A%E6%B1%9F%E5%AE%81%E9%9D%92%E5%B9%B4%E5%88%9B%E6%96%B0%E5%88%9B%E4%B8%9A%E5%98%89%E5%B9%B4%E5%8D%8E%E5%9C%86%E6%BB%A1%E8%90%BD%E5%B9%95.png"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/8%E6%A0%87%E9%A2%98%E5%9B%BE.png","name":"《做一个思想清醒的人》 （黄相怀/著）","time":"2018.12.14","content":"本书首先对意识形态能力的重要性进行了介绍，然后分别从意识形态的鉴别力、学习力、思考力、创新力、表达力等五个角度，对党员干部如何提高意识形态能力进行了详细论述。全书语言通俗生动，引用大量案例，可读性强，是广大党员干部向党中央看齐、增强“四个意识”、避免陷入意识形态误区的优秀通俗读物。","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/8%E9%9B%86%E8%81%9A%E5%85%A8%E7%90%83%E5%88%9B%E6%96%B0%E8%B5%84%E6%BA%90+2018%E4%B8%AD%E5%9B%BD%E5%88%9B%E4%B8%9A%E8%80%85%E5%B3%B0%E4%BC%9A%E5%9C%A8%E5%8D%97%E4%BA%AC%E4%B8%BE%E5%8A%9E.png"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/%E5%8C%97%E5%A4%A7%E5%88%9B%E4%B8%9A.png","name":"北大创业训练营南京基地落户江宁","time":"2018.12.14","content":"近期，北京大学创业训练营（简称“北创营”）及北大南京校友会共同举办的北创营长三角创新创业特训班……","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/%E5%8C%97%E5%A4%A7%E5%88%9B%E4%B8%9A.jpg"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/%E5%B0%B1%E4%B8%9A%E5%88%9B%E4%B8%9A%E6%B2%83%E5%9C%9F.png","name":"开发区高新园打造招才引智“强磁场”","time":"2018.12.14","content":"距离“两落地一融合”工作一年多时间，笔者了解到，截至目前，江宁开发区高新园已经签约新型研发机构47家……","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/%E5%BC%80%E5%8F%91%E5%8C%BA%E9%AB%98%E6%96%B0%E5%9B%AD.jpg"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/%E5%BC%BA%E5%8C%96%E8%A6%81%E7%B4%A0%E4%BF%9D%E9%9A%9C.png","name":"强化要素保障 助创业投资驶入“快车道”","time":"2018.12.14","content":"栽好梧桐树，自有凤凰来，优化营商环境，土地、资金、用工等要素保障缺一不可。","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/%E5%BC%BA%E5%8C%96%E8%A6%81%E7%B4%A0%E4%BF%9D%E9%9A%9C.jpg"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/%E5%B0%B1%E4%B8%9A%E5%88%9B%E4%B8%9A%E6%B2%83%E5%9C%9F.png","name":"深耕“就业创业”沃土，拓宽富民增收路","time":"2018.12.14","content":"“春风行动”专场招聘会、宁洛对口扶贫劳务协作专场招聘……","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/%E5%B0%B1%E4%B8%9A%E5%88%9B%E4%B8%9A%E6%B2%83%E5%9C%9F.jpg"],]
            self.dataAry = NSArray(array: ary)
            
            self.tabview.reloadData()
        }else if str == "弱势群体"{
            let ary = [["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/2.png","name":"江宁区章村社区开展关爱残疾人走访慰问活动","time":"2018.12.17","content":"为了提高社区居民对残疾人的理解与关爱，关注特殊群体、弱势群体，倡导扶残助残的良好社会风尚，实现美好中国梦……","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/2%E3%80%81%E6%B1%9F%E5%AE%81%E5%8C%BA%E7%AB%A0%E6%9D%91%E7%A4%BE%E5%8C%BA%E5%BC%80%E5%B1%95.png"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/6.png","name":"区人社局送服务到养老院","time":"2018.12.15","content":"1月6日，区人力资源和社会保障局信息化管理服务中心的工作人员来到沐春园养老院，为老人们开展人社相关政策讲座，并提供相关业务上门办理服务。","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/6%E5%8C%BA%E4%BA%BA%E7%A4%BE%E5%B1%80%E9%80%81%E6%9C%8D%E5%8A%A1%E5%88%B0%E5%85%BB%E8%80%81%E9%99%A2.png"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/12.png","name":"她在你身边|暖心守护，新时代文明实践江宁巾帼志愿服务队在行动","time":"2018.12.14","content":"一场大雪,让江宁变得更美了。江宁之美,没在街区,美在风景,美在湖泊,但更美的是她们--","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/12%E5%A5%B9%E5%9C%A8%E4%BD%A0%E8%BA%AB%E8%BE%B9.png"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/14.png","name":"江宁二院开展“天使心韵 暖冬行动”慈善一日捐活动","time":"2018.12.14","content":"残疾人是社会大家庭中的弱势润体,相当一部分精神残疾患者有家族遗传史,他们的家庭因病致穷,因病致孤。在江宁..","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/14%E6%B1%9F%E5%AE%81%E4%BA%8C%E9%99%A2%E5%BC%80%E5%B1%95%E2%80%9C%E5%A4%A9%E4%BD%BF%E5%BF%83%E9%9F%B5+%E6%9A%96%E5%86%AC%E8%A1%8C%E5%8A%A8%E2%80%9D%E6%85%88%E5%96%84%E4%B8%80%E6%97%A5%E6%8D%90%E6%B4%BB%E5%8A%A8.png"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/%E8%B0%B7%E9%87%8C%E2%80%9C%E8%87%AA%E6%8E%8F%E8%85%B0%E5%8C%85%E2%80%9D.png","name":"谷里“自掏腰包”让群众宽心看病","time":"2018.12.14","content":"近日，据江宁谷里街道消息，今年该街道继续加大居民医疗保障的财政支持力度……","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/%E8%B0%B7%E9%87%8C%E2%80%9C%E8%87%AA%E6%8E%8F%E8%85%B0%E5%8C%85%E2%80%9D.jpg"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/%E4%BA%92%E8%81%94%E7%BD%91%2B%E6%85%88%E5%96%84%E8%B6%85%E5%B8%82.png","name":"“互联网+慈善超市”实现精准爱心捐赠","time":"2018.12.14","content":"近日，情暖金陵2018南京市暨江宁区“慈善一日捐”启动仪式……","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/%E4%BA%92%E8%81%94%E7%BD%91%2B%E6%85%88%E5%96%84%E8%B6%85%E5%B8%82.jpg"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/%E4%BA%92%E8%81%94%E7%BD%91%EF%BC%8B%E5%BE%AE%E5%BF%83%E6%84%BF.png","name":"“互联网+微心愿”开启残疾人圆梦“O2O”","time":"2018.12.14","content":"东山街道开展了残疾人新年圆梦活动，面向辖区内16个社区2000多名残疾人征集“微心愿”……","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/%E4%BA%92%E8%81%94%E7%BD%91%2B%E5%BE%AE%E5%BF%83%E6%84%BF.jpg"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/%E6%B1%9F%E5%AE%81%E4%BA%8C%E9%99%A2.png","name":"江宁二院关爱特殊群体","time":"2018.12.14","content":"近日，江宁二院举行“天使心韵暖冬行动”慈善一日捐，140名患者接受了捐赠。","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/%E6%B1%9F%E5%AE%81%E4%BA%8C%E9%99%A2.jpg"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/%E7%A7%A3%E9%99%B5%E5%85%AC%E7%9B%8A1.jpg","name":"秣陵公益组织为老人免费供餐","time":"2018.12.14","content":"“在家门口助餐点就可以吃到热乎的饭菜，真的很幸福。”秣陵街道东南社区79岁老人……","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/%E7%A7%A3%E9%99%B5%E5%85%AC%E7%9B%8A.jpg"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/%E8%AE%A9%E6%A2%A6%E6%83%B3%E6%88%90%E7%9C%9F.png","name":"让梦想成真——双金社区为困境儿童过圣诞节","time":"2018.12.14","content":"圣诞节，孩子们的幸福就是拥有一件圣诞礼物。","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/%E8%AE%A9%E6%A2%A6%E6%83%B3%E6%88%90%E7%9C%9F.jpg"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/%E4%BA%BA%E7%A4%BE%E5%B1%80%E9%80%81%E6%9C%8D%E5%8A%A11.jpg","name":"人社局送服务到养老院","time":"2018.12.14","content":"1月6日，区人力资源和社会保障局信息化管理服务中心工作人员来到沐春园养老院，为老人们开展人社相关政策讲座。","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/%E4%BA%BA%E7%A4%BE%E5%B1%80%E9%80%81%E6%9C%8D%E5%8A%A1.jpg"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/%E5%B0%8F%E8%91%B5%E8%8A%B1.png","name":"“小葵花”助未成年人健康成长","time":"2018.12.14","content":"12月22日，由区妇联、区民政局主办的“心手相牵与爱同行”2018年江宁区“小葵花”两周年……","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/%E5%B0%8F%E8%91%B5%E8%8A%B1.jpg"],
                       ]
            self.dataAry = NSArray(array: ary)
            
            self.tabview.reloadData()
        }else if str == "新江宁人"{
            let ary = [["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/4.png","name":"秣陵为群众送上“法治礼包”","time":"2018.12.17","content":"近日,秣陵街道组织辖区司法所,综治办,劳保所等17家普法成员单位,在胜太社区广场开展了一场普法宣传活动。","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/4%E7%A7%A3%E9%99%B5%E4%B8%BA%E7%BE%A4%E4%BC%97%E9%80%81%E4%B8%8A%E2%80%9C%E6%B3%95%E6%B2%BB%E7%A4%BC%E5%8C%85%E2%80%9D.png"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/10.png","name":"淳化人——不畏严寒御雪行动","time":"2018.12.15","content":"12月30日中午前后江宁全区开始出现降雪，咱们大淳化也开始飘起2018年最后一场雪……","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/10%E6%B7%B3%E5%8C%96%E4%BA%BA%E2%80%94%E2%80%94%E4%B8%8D%E7%95%8F%E4%B8%A5%E5%AF%92%E5%BE%A1%E9%9B%AA%E8%A1%8C%E5%8A%A8.png"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/2018%E5%B9%B4%E6%B4%9B%E5%8D%97%E5%8E%BF.png","name":"2018年洛南县首轮322名务工人员赴宁就业","time":"2018.12.15","content":"2月24日宁洛对口扶贫劳务协作招聘会以来,洛南县首轮322名务工人员分批来宁踏上打工路。","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/2018%E5%B9%B4%E6%B4%9B%E5%8D%97%E5%8E%BF.jpg"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/%E5%AE%81%E6%B4%9B%E5%8A%B3%E5%8A%A1%E5%8D%8F%E4%BD%9C.png","name":"宁洛劳务协作岗前职业技能培训班正式开班","time":"2018.12.15","content":"为更好的开展对口帮扶劳务协作，做好就业配套服务，2月26日上午，江宁区人社局……","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/%E5%AE%81%E6%B4%9B.jpg"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/%E6%96%B0%E7%96%86%E7%89%B9%E5%85%8B%E5%8E%BF.png","name":"新疆特克斯县11名务工人员来宁就业","time":"2018.12.15","content":"8月15日下午，首批特克斯县务工人员在当地人社局的陪同下……","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/%E6%96%B0%E7%96%86%E7%89%B9%E5%85%8B%E6%96%AF%E5%8E%BF11%E5%90%8D%E5%8A%A1%E5%B7%A5%E4%BA%BA%E5%91%98%E6%9D%A5%E5%AE%81%E5%B0%B1%E4%B8%9A.jpg"],]
            self.dataAry = NSArray(array: ary)
            
            self.tabview.reloadData()
        }else if str == "新型农民"{
            let ary = [["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/1.png","name":"江宁区林业局举办新型职业农民培训传播休闲农业发展新理念","time":"2018.12.17","content":"为贯彻推进乡村振兴战略，逐步提高全区从事休闲农业经营管理人员能力素质，培养早就一支“懂农业、爱农村、爱农民”的三农人才队伍……","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/1%E6%B1%9F%E5%AE%81%E5%8C%BA%E6%9E%97%E4%B8%9A%E5%B1%80%E4%B8%BE%E5%8A%9E%E6%96%B0%E5%9E%8B%E2%80%A6%E2%80%A6.png"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/p10.png","name":"冬闲变“冬学”，新农民致富忙","time":"2018.12.17","content":"眼下正值冬季农闲时节，然而全区广大新农民却没有闲下来，反而变得更忙……","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/%E5%86%AC%E9%97%B2%E5%8F%98%E2%80%9C%E5%86%AC%E5%AD%A6%E2%80%9D.jpg"],
                       ["img":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/titleImg/p11.png","name":"“股改”探新路 农民得实惠，农村集体产权改革蹄疾步稳","time":"2018.12.17","content":"为贯彻推进乡村振兴战略，逐步提高全区从事休闲农业经营管理人员能力素质，培养早就一支“懂农业、爱农村、爱农民”的三农人才队伍……","url":"https://s3.cn-north-1.amazonaws.com.cn/wmxj/hardCodeImg/contentImg/%E8%82%A1%E6%94%B9%E3%80%81%E5%86%9C%E6%B0%91.jpg"]]
            self.dataAry = NSArray(array: ary)
            
            self.tabview.reloadData()
        }
    }
    
    func loadData(){
        if self.dataAry.count == 0{
            let ary = [["img":"lilunexue1","name":"《习近平用典（第二辑）》  （人民日报评论部/著）","time":"2018.12.17","content":"党的十八大以来，习近平总书记发表的一系列重要讲话和文章中，精妙的典故信手拈来，广博的引用贯通古今。从这些用典中，既可以追溯习近平新时代中国特色社会主义思想的源头活水，又能在古为今用的创造性转化中感受中华优秀传统文化的博大精深。《习近平用典》第二辑沿用第一辑体例，收入习近平总书记近年来引用的，体现习近平新时代中国特色社会主义思想的典故148则，对其现实意义和背景义理进行解读、阐释，是一部学习领会习近平新时代中国特色社会主义思想的重要读本。 "],
                       ["img":"lilunexue2","name":"《学而时习之——读懂新时代的100个关键词》","time":"2018.12.15","content":"进入新时代，以习近平同志为核心的党中央深刻回答了新时代坚持和发展什么样的中国特色社会主义、怎样坚持和发展中国特色社会主义的重大时代课题，形成了一系列治国理政新理念、新思想、新战略，提出了“中国梦”“人类命运共同体”“一带一路”等带有鲜明中国特色与时代印记的关键词。本书选取了最重要的100个关键词，系统梳理了这些关键词背后“是什么”“为什么”“怎么办”等问题，旨在为党员干部深入学习贯彻党的十九大精神、深入学习领会习近平新时代中国特色社会主义思想提供有益参考。 "],
                       ["img":"lilunexue3","name":"《做一个思想清醒的人》 （黄相怀/著）","time":"2018.12.14","content":"本书首先对意识形态能力的重要性进行了介绍，然后分别从意识形态的鉴别力、学习力、思考力、创新力、表达力等五个角度，对党员干部如何提高意识形态能力进行了详细论述。全书语言通俗生动，引用大量案例，可读性强，是广大党员干部向党中央看齐、增强“四个意识”、避免陷入意识形态误区的优秀通俗读物。"]]
            self.dataAry = NSArray(array: ary)
            
            self.tabview.reloadData()
        }
    }
    
    func setUpUI(){
        
        self.tabview.frame = CGRect(x: 0, y: 4, width: ScreenSize_Width, height: ScreenSize_Height - 4 - 44 - StatusBar_Height)
        tabview.dataSource = self
        tabview.delegate = self
        tabview.register(UINib.init(nibName: "LBInformationTableViewCell", bundle: nil), forCellReuseIdentifier: "LBInformationTableViewCell")
        self.view.addSubview(tabview)
        
        if #available(iOS 11.0, *) {
            self.tabview.estimatedSectionHeaderHeight = 0;
            self.tabview.estimatedSectionFooterHeight = 0;
            self.tabview.contentInsetAdjustmentBehavior = .never;
        }
        else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
}
extension LBInformationListViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataAry.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabview.dequeueReusableCell(withIdentifier: "LBInformationTableViewCell", for: indexPath) as! LBInformationTableViewCell
        cell.selectionStyle = .none
        let dic = self.dataAry[indexPath.row] as! NSDictionary
        var img = ""
        if let imgStr = dic["img"] as? String{
            img = imgStr
        }

        cell.leftIcon.sd_setImage(with: URL.init(string: img), placeholderImage: UIImage.init(named: img), options: .continueInBackground, completed: nil)
        cell.leftIcon.layer.masksToBounds = true
        cell.leftIcon.layer.cornerRadius = 3
        cell.leftIcon.contentMode = .scaleAspectFill
        cell.nameLab.text = dic["name"] as? String
        cell.contentLab.text = dic["content"] as? String
        cell.timeLab.text = dic["time"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let vc = LBInfoDetailViewController()
        //vc.dataDic = dataAry[indexPath.row] as! NSDictionary
        //self.navigationController?.pushViewController(vc, animated: true)
        
        let dic = dataAry[indexPath.row] as! NSDictionary
        if dic["url"] != nil{
            let webview = TOWebViewController.init(urlString: dic["url"] as! String)
            webview.navigationButtonsHidden = true
            webview.showUrlWhileLoading = false
            webview.loadingBarTintColor = LXSize.baseColor()
            webview.webTitle = dic["name"] as! String
            webview.buttonTintColor = LXSize.baseColor()
            self.navigationController?.pushViewController(webview, animated: true)
        }
    }
}
