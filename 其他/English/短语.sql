use `english`;

DROP TABLE IF EXISTS `english`.`phrases`;
CREATE TABLE `english`.`phrases` (
  `phrases` VARCHAR(1000) NOT NULL COMMENT '短语',
  `paraphrase` VARCHAR(45) NULL COMMENT '释义',
  PRIMARY KEY (`phrases`));

insert into `english`.`phrases` (`phrases`, `paraphrase`) values ('a bit (of)', '一点，一些');
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ('a bunch of', '一束；一捆');
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ('a crowd of', '一群；许多');
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ('a few', '几个；一些');
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ('a good/great many', '很多；许多');
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ('a good/great deal (of)', '大量；很多');
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ('a lot (of)', '许多；大量');
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("a large amount of", "许多（接不可数名词）");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("a (large) quantity of", "许多（接可数或不可数名词）");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("a number of", "一些；若干");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("a series of", "一系列的");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("a set of", "一组，一套");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("a variety of", "多样，种种，多种类");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("above all ", "首要的；最重要的");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("according to", "根据；依照");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("across from", "在对面");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("act a part", "1. 扮演一个角色  2. 假装");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("act as", "充当，担任");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("act on", "照••••••行事");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("act out", "1. 表演出；描绘出  2.实行；实践");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("add to", "给••••••添加");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("add up", "1. 把••••••加在一起  2. 有意义；得出••••••结论");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("add up to", "1. 总计达  2. 其含义为；意味着");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("admire sb. for ...", "（在某方面）羡慕某人");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("admit of", "容许有");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("admit to", "承认");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("admit ... to (into) ...", "允许……进入……");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("after all", "终究；毕竟");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("again and again", "一遍又一遍");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("agree on", "就……达成协议");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("in advance", "预先，事先");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("take advantage of", "利用");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("afford to do sth.", "负担得起做某事");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("against one's will", "违背某人的意愿");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("agree to", "同意；赞成");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("agree with", "1. 同意（某人）的意见  2. 与……相一致  3. （气候、食物）适合");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("ahead of", "在……前面");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("aim at", "1. 瞄准  2. 追求；旨在");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("all alone", "独自地");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("all along", "一致；始终");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("all at once", "忽然；突然");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("all over", "1. 到处；处处 2. 完全；十分 3. 全身；浑身 4. 完结；终结");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("all right", "1. 行；好；没问题；没关系 2. （身体）好；情况不错 3. 很；非常");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("all the same", "还是；仍然");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("all but",
	"几乎跟……一样，除了……都");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("and so on", "如此；等等");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("answer for", "为……负责；因……得到报应");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("apart from", "除……外还");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("apply one's mind to", "专心于");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("arrive at", "1. 到达；来到 2. 得出……结果");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("arrive in", "到达；抵达");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("(just) around the corner", "即将来临；马上就到");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("as a result (of)", "结果");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("as long as", "1. 长达；达……之久 2. 在……情况下；只要");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("as soon as", "一……就");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("ask about", "询问有关……的事");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("ask after", "问候");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("ask for", "1. 请求 2. 询问；找");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("at a loss", "不知所措；困惑不解");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("at a time", "一次（常与数词通用）");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("at a distance", "在远处");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("at first sight", "乍一看");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("at hand", "在手边，在附近，即将到来");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("at last", "终于；最后");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("as least", "至少");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("at (the) most", "最多");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("at once", "立刻");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("at one time", "曾经；有段时间");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("at present", "现在；目前");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("at table", "在就餐");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("at the cost of", "以……为代价");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("at the moment", "此刻；当时");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("at the risk of", "冒着……危险");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("at the sight of", "第一眼；一看见");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("at work", "1. （人）在工作 2. （机器）在运转");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("at will", "随意，任意");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("", "");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("", "");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("", "");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("", "");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("", "");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("", "");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("", "");
insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("", "");














insert into `english`.`phrases` (`phrases`, `paraphrase`) values ("", "");

select * from `english`.`phrases`;
