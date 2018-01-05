use `english`;

DROP TABLE IF EXISTS `english`.`sentence`;
CREATE TABLE `english`.`sentence` (
  `sentence` VARCHAR(1000) NOT NULL COMMENT '句子，命题；宣判，判决',
  `translate` VARCHAR(45) NULL COMMENT '翻译',
  `phrases` VARCHAR(1000) NOT NULL COMMENT '短语',
  `paraphrase` VARCHAR(45) NULL COMMENT '释义',
PRIMARY KEY (`sentence`));


insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ('a bit (of)', 'It looks a bit large.', '看起来有点大。');
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ('a bit (of)', 'He knows a bit of German.', '他懂点德语。');
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ('a bunch of', 'A crowd of children with bouquets in their hands rushed over to the foreign guests', '一群孩子手持鲜花向外国客人跑去。');
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ('a few', 'He will be here in a few days.', '他过几天就来。');
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ('a good/great many', 'Mr. Liu rang her up a good many times.', '刘先生多次打电话给她。');
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ('a good/great deal (of)', "I'm afraid I've given you a good deal of trouble.", '我恐怕给你添加了很多麻烦。');
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("a good/great deal (of)", "After taking the medicine he is now a great deal better.", "服药后，他现在觉得好多了。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("a lot (of)", "The students learned a lot from the teacher.", "学生们从老师那里学到了许多知识。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("a lot (of)", "He borrowed a lot of books from the old man.", "他从那位老人那里借到很多书。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("a large amount of", "Large amounts of money has been wasted.", "大量的金钱被浪费掉了。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("a (large) quantity of", "He ate a small quantity of rice.", "他吃了少量的米饭。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("a number of", "Quite a number of students of students in our department are from the north.", "我们系有许多学生来自北方。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("a series of", "A series of reports will be given on the war.", "关于这场战争将有一系列的报道。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("a set of", "The factory bought a set of equipment form abroad.", "这家工厂从国外买了一套设备。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("a variety of", "The shopping center sells a variety of goods", "这个购物中心出售许多种商品。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("above all", "That is what I prefer above all", "那是我最喜欢的东西。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("according to", "According to the weather report, there will be rain this afternoon.", "根据天气预报，今天下午有雨。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("across from", "The hospital is across from the General Post Office", "医院在邮局总局对面。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("act a part", "he acted a part in Othello.", "他在《奥塞罗》里扮演了一个角色。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("act a part", "She walked as if nothing had happened to her leg, but everyone could see that she was merely acting a part.", "虽然她走路时腿好像没有什么毛病，但大家都看得出来她是假装的。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("act as", "He acted as chairman of the conference.", "他担任了大会的主席。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("act on", "He acts on principles.", "他按原则行事。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("act out", "The students tried to act out the dialogue.", "学生们试图将对话表演出来。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("act out", "The professor tried to act out his beliefs all his life.", "那位教授毕生致力于实践自己的信仰。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("add to", "Her beautiful dance added a lot to the evening.", "她美丽的舞蹈给晚会添加了许多乐趣。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("add up", "Please add all these figures up.", "请把这些数组加在一起。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("add up", "It just doesn't add up.", "这简直没有意义。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("add up to", "The expenses add up to 200 yuan.", "支出合计为 200 元。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("add up to", "It all adds up to this——the man has agreed to take on the job.", "这意味着：此人已同意做这项工作了。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("admire sb. for ...", "I  admire her for her bravery.", "我钦佩她的勇敢。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("admit of", "A solution to the problem admits of no delay.", "解决这一问题刻不容缓。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("admit to", "Tom admitted to a feeling of shame for himself.", "汤姆承认为自己感到惭愧。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("admit ... to (into) ...", "People under 18 are not admitted to the film.", "未满 18 周岁的人不允许看此电影。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("after all", "Although they met with difficulties, they succeeded after all.", "他们虽然碰到了困难，但他们还是成功了。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("again and again", "The professor asked his students to read the article again and again.", "这位教授让他的学生再三读那篇文章。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("agree on", "The two parties finally agreed on the terms of contract.", "双方就合同的条款终于达成了协议。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("in advance", "You must pay for the book in advance.", "你必须预先支付书的钱。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("take advantage of", "We must take advantage of all educational opportunities.", "我们必须利用一切教育的机会。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("afford to do sth.", "The couple can't afford to buy a house of that kind.", "这对夫妇买不起那种房子。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("against one's will", "She got married against her will.", "她的婚姻违背了她本人的意愿。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("agree to", "I fully agree to the plan you put forward at the meeting.", "我完全同意你在会上提出的计划");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("agree with", "I can't agree with you on that point.", "在那一点上我不同意你的意见");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("agree with", "What he did didn't agree with what he said.", "他的言行不一致。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("agree with", "Too much salt won't agree with me.", "盐太多不适合我的口味。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("ahead of", "During the last lap in the 3 000-metre race, she dashed ahead of the others.", "在 3 000 米比赛的最后一圈，她冲到了别人的前面。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("aim at", "He aimed at the beast and shot it dead.", "他瞄准那个野兽并把它打死。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("aim at", "What are you aiming at?", "你的追求是什么？");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("all alone", "The little boy completed the job all alone.", "这个小男孩独自完成了那项工作。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("all along", "I think all along that he would be an honest man.", "我一直在想他是一个诚实的人。");
insert into `english`.`sentence` (`phrases`, `sentence`, `translate`) values ("all at once", "I was watching TV when all at once there was a knock at the door.", "我正在看电视，突然有人敲门。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("all over", "到处；处处", "The boy has been looking all over for his bike.", "那男孩在到处找他的自行车。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("all over", "完全；十分", "She is not a bit like her father and she is her mother all over.", "她一点也不像其父亲，却很像她母亲。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("all over", "全身；浑身", "After the rain, she was wet all over.", "雨后，她全身都湿透了。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("all over", "完结；终结", "The movie was all over when she got to the cinema.", "她到电影院时电影已演完了。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("all right", "行；好；没问题；没关系", "Will tomorrow at 14:00 o'clock be all right for you ?", "明天下入 2 点钟行吗？");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("all right","（身体）好；情况不错", "How are you? I'm all right.", "你好吗？ 我现在全好了。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("all right", "很；非常", "I know him all right.", "我对他十分了解。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("all the same", "还是；仍然", "Thank you all the same.", "还是要谢谢你。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("all but", "几乎跟……一样，除了……都", "He is all but dead.", "他几乎跟死了一样。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"and so on",
	"如此；等等",
	"They carried water, food, books and so on.",
	"他们拿着水，食物，书籍等。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"answer for",
	"为……负责，因……得到报应",
	"You will answer for what you have done.",
	"你要为你的所作所为负责。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"aprt from",
	"除……外还",
	"He can speak French part from English.",
	"除英语外他还会说法语。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"apply one's mind to",
	"专心于",
	"He applied his mind to his study.",
	"他专心于他的学习。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"arrive at",
	"到达；来到",
	"They arrived at the station just in time to catch the train for Beijing",
	"他们到达车站时，正好赶上开往北京的火车");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"arrive at",
	"得出……结果",
	"We arrived at a conclusion after six months of patient research.",
	"耐心研究了 6 个月，我们终于取得了结果。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"arrive in",
	"到达；抵达",
	"The American president arrived in Beijing by special plane last Sunday.",
	"美国总统于上周日乘专机抵达北京。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"as a result (of)",
	"结果",
	"As a result the meeting had to be put of",
	"其结果是会议不得不延期。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"as a result (of)",
	"结果",
	"As a result of the hard work the scientist has succeeded at last.",
	"由于努力工作，这位科学家最后成功了。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"as soon as",
	"长达；达……之久",
	"Summer on Hainan Island lasts as long as eight and a half months",
	"海南岛的夏天长达 8 个半月。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"as long as",
	"在……情况下；只要",
	"As long as you are happy, it doesn't matter what you do.",
	"只要你高兴，做什么都行。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"as soon as",
	"一……就",
	"Please write to me as soon as you get there.",
	"一到那里，就请给我来信。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"ask about",
	"询问有关……的事",
	"He once asked about you.",
	"他曾经问到过你。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"ask after",
	"问候",
	"My father asked after you.",
	"我父亲向你表示问候。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"ask for",
	"请求",
	"He asked for time to think all this over.",
	"他要求给他时间把这一切好好想想。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"ask for",
	"询问；找",
	"Did anyone ask for me?",
	"有人找我吗？");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"at a loss",
	"不知所措；困惑不解",
	"A good salesman is never at a loss for words.",
	"一个好的推销员从来也不会拙于言辞。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"at a time",
	"一次（常与数词通用）",
	"He can eat 10 apples at a time.",
	"他一次能吃上 10 个苹果。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"at a distance",
	"在远处",
	"The scenery looks more beautiful at a distance.",
	"这风景从远处看更加美丽。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"at first sight",
	"乍一看",
	"They fell in love at first sight",
	"他们一见钟情。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"at hand",
	"在手边，在附近，即将到来",
	"Punishment is at hand.",
	"惩罚就要到来。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"at last",
	"终于；最后",
	"For a long time he hesitated, but at last he decided to go.",
	"他犹豫了一段时间，但最后还是决定去。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"as least",
	"至少",
	"I had thought that he had been married at least 20 years ago.",
	"我原认为他 20 年前就结婚了。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"at (the) most",
	"最多",
	"It won't take too long to get there two hours at most.",
	"到那里不用很长时间，最多两个小时。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"at once",
	"立刻",
	"When he heard the news, he rushed over at once",
	"他听到这一消息后就立刻赶去了。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"at one time",
	"曾经；有段时间",
	"We were very good friends at one time.",
	"我们曾经是非常好的朋友。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"at present",
	"现在；目前",
	"At present there are about 4 000 students in our school.",
	"我们学校目前大约有 4 000 学生。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"at table",
	"在就餐",
	"They were at table when I called.",
	"我去看望他们时，他们正在吃饭。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"at the cost of",
	"一……为代价",
	"I bought it at the cost of 100 dollars",
	"我花 100 美元买下了它。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"at the moment",
	"此刻；当时",
	"I rang him up, but at the moment the line was busy.",
	"我给他打电话，但那是正占线。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"at the risk of",
	"冒着……危险",
	"I'll say what I think even at the risk of offending you.",
	"即使冒犯你，我也要怎么想怎么说。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"at the sight of",
	"第一眼；一看见",
	"At the sight of her mother, the little girl stopped crying.",
	"一看见她妈妈，这小女孩就不哭了。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"at work",
	"（人）在工作",
	"His father is at work now and won't be home before 6 o'clock.",
	"他父亲在工作，6 点以前不会回家。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"at work",
	"（机器）在运转",
	"The machine is at work smoothly.",
	"机器正在平稳的运转。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values (
	"at will",
	"随意，任意",
	"Using power at will is dangerous for the government.",
	"政府随意使用权利是危险的。");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");
insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");




























insert into `english`.`sentence` (`phrases`, `paraphrase`, `sentence`, `translate`) values ("", "", "", "");


select `phrases`, `paraphrase`, `sentence`, `translate` from `english`.`sentence` order by `phrases`;
