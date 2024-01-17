import Foundation

struct LondonBaptistAbout {
    let description: [String]
}

struct LondonBaptistPreface {
    let chapter: String
    let title: String
    let content: [Any]
}

struct LbChapterContent {
    let superscript: Int
    let text: String
    let scriptures: String
}

struct LbChapter {
    let chapter: Int
    let title: String
    let topic: [String]
    let content: [LbChapterContent]
}

struct LondonBaptistData {
    let slug: String
    let title: String
    let date: String
    let about: LondonBaptistAbout
    let content: [Any]
}

let preface = LondonBaptistPreface(
    chapter: "Preface",
    title: "To the Judicious and Impartial Reader",
    content: [
        "It is now many years since divers of us (with other sober Christians then living and walking in the way of the Lord that we professe) did conceive our selves to be under a necessity of Publishing a Confession of our Faith, for the information, and satisfaction of those, that did not throughly understand what our principles were, or had entertained prejudices against our Profession, by reason of the strange representation of them, by some men of note, who had taken very wrong measures, and accordingly led others into misapprehensions, of us, and them: and this was first put forth about the year, 1643. in the name of seven Congregations then gathered in London; since which time, diverse impressions thereof have been dispersed abroad, and our end proposed, in good measure answered, inasmuch as many (and some of those men eminent, both for piety and learning) were thereby satisfied, that we were no way guilty of those Heterodoxies and fundamental errors, which had too frequently been charged upon us without ground, or occasion given on our part. And forasmuch, as that Confession is not now commonly to be had; and also that many others have since embraced the same truth which is owned therein; it was judged necessary by us to joyn together in giving a testimony to the world; of our firm adhering to those wholesome Principles, by the publication of this which is now in your hand.",
        "And forasmuch as our method, and manner of expressing our sentiments, in this, doth vary from the former (although the substance of the matter is the same) we shall freely impart to you the reason and occasion thereof. One thing that greatly prevailed with us to undertake this work, was (not only to give a full account of our selves, to those Christians that differ from us about the subject of Baptism, but also) the profit that might from thence arise, unto those that have any account of our labors, in their instruction, and establishment in the great truths of the Gospel; in the clear understanding, and steady belief of which, our comfortable walking with God, and fruitfulness before him, in all our ways, is most neerly concerned; and therefore we did conclude it necessary to expresse our selves the more fully, and distinctly; and also to fix on such a method as might be most comprehensive of those things which we designed to explain our sense, and belief of; and finding no defect, in this regard, in that fixed on by the assembly, and after them by those of the Congregational way, we did readily conclude it best to retain the same order in our present confession: and also, when we observed that those last mentioned, did in their confession (for reasons which seemed of weight both to themselves and others) choose not only to express their mind in words concurrent with the former in sense, concerning all those articles wherein they were agreed, but also for the most part without any variation of the terms we did in like manner conclude it best to follow their example in making use of the very same words with them both, in these articles (which are very many) wherein our faith and doctrine is the same with theirs, and this we did, the more abundantly, to manifest our consent with both, in all the fundamental articles of the Christian Religion, as also with many others, whose orthodox confessions have been published to the world; on behalf of the Protestants in divers Nations and Cities: and also to convince all, that we have no itch to clogge Religion with new words, but do readily acquiesce in that form of sound words, which hath been, in consent with the holy Scriptures, used by others before us; hereby declaring before God, Angels, & Men, our hearty agreement with them, in that wholesome Protestant Doctrine, which with so clear evidence of Scriptures they have asserted: some things indeed, are in some places added, some terms omitted, and some few changed, but these alterations are of that nature, as that we need not doubt, any charge or suspition of unsoundness in the faith, from any of our brethren upon the account of them.",
        "In those things wherein we differ from others, we have exprest our selves with all candor and plainness that none might entertain jealousie of ought secretly lodged in our breasts, that we would not the world should be acquainted with; yet we hope we have also observed those rules of modesty, and humility, as will render our freedom in this respect inoffensive, even to those whose sentiments are different from ours.",
        "We have also taken care to affix texts of Scripture, in the margin for the confirmation of each article in our confession; in which work we have studiously indeavoured to select such as are most clear and pertinent, for the proof of what is asserted by us: and our earnest desire is, that all into whose hands this may come, would follow that (never enough commended) example of the noble Bereans, who searched the Scriptures daily, that they might find out whether the things preached to them were so or not.",
        "There is one thing more which we sincerely professe, and earnestly desire credence in, viz. That contention is most remote from our design in all that we have done in this matter: and we hope the liberty of an ingenuous unfolding our principles, and opening our hearts unto our Brethren, with the Scripture grounds on which our faith and practise leanes, will by none of them be either denyed to us, or taken ill from us. Our whole design is accomplished, if we may obtain that Justice, as to be measured in our principles, and practise, and the judgement of both by others, according to what we have now published; which the Lord (whose eyes are as a flame of fire) knoweth to be the doctrine, which with our hearts we must firmly believe, and sincerely indeavour to conform our lives to. And oh that other contentions being laid asleep, the only care and contention of all upon whom the name of our blessed Redeemer is called, might for the future be, to walk humbly with their God, and in the exercise of all Love and Meekness towards each other, to perfect holyness in the fear of the Lord, each one endeavouring to have his conversation such as becometh the Gospel; and also suitable to his place and capacity vigorously to promote in others the practice of true Religion and undefiled in the sight of God and our Father. And that in this backsliding day, we might not spend our breath in fruitless complaints of the evils of others; but may every one begin at home, to reform in the first place our own hearts, and wayes; and then to quicken all that we may have influence upon, to the same work; that if the will of God were so, none might deceive themselves, by resting in, and trusting to, a form of Godliness, without the power of it, and inward experience of the efficacy of those truths that are professed by them.",
        "And verily there is one spring and cause of the decay of Religion in our day, which we cannot but touch upon, and earnestly urge a redresse of; and that is the neglect of the worship of God in Families, by those to whom the charge and conduct of them is committed. May not the grosse ignorance, and instability of many; with the prophaneness of others, be justly charged upon their Parents and Masters; who have not trained them up in the way wherein they ought to walk when they were young? but have neglected those frequent and solemn commands which the Lord hath laid upon them so to catechize, and instruct them, that their tender years might be seasoned with the knowledge of the truth of God as revealed in the Scriptures; and also by their own omission of Prayer, and other duties of Religion in their families, together with the ill example of their loose conversation, have inured them first to a neglect, and then contempt of all Piety and Religion? we know this will not excuse the blindness, or wickedness of any; but certainly it will fall heavy upon those that have thus been the occasion thereof; they indeed dye in their sins; but will not their blood be required of those under whose care they were, who yet permitted them to go on without warning, yea led them into the paths of destruction? and will not the diligence of Christians with respect to the discharge of these duties, in ages past, rise up in judgment against, and condemn many of those who would be esteemed such now?",
        "We shall conclude with our earnest prayer, that the God of all grace, will pour out those measures of his holy Spirit upon us, that the profession of truth may be accompanyed with the sound belief, and diligent practise of it by us; that his name may in all things be glorified, through Jesus Christ our Lord, Amen.",
    ]
)

let chapter1 = LbChapter(
    chapter: 1,
    title: "Of the Holy Scriptures",
    topic: ["scripture"],
    content: [
        LbChapterContent(
            superscript: 1,
            text: "The Holy Scripture is the only sufficient, certain, and infallible rule of all saving knowledge, faith, and obedience.",
            scriptures: "2 Timothy 3:15-17; Isaiah 8:20; Luke 16:29, 31; Ephesians 2:20"
        ),
        LbChapterContent(
            superscript: 2,
            text: "Although the light of nature, and the works of creation and providence do so far manifest the goodness, wisdom, and power of God, as to leave men inexcusable; yet are they not sufficient to give that knowledge of God and his will which is necessary unto salvation.",
            scriptures: "Romans 1:19-21; Romans 2:14-15; Psalms 19:1-3"
        ),
        LbChapterContent(
            superscript: 3,
            text: "Therefore it pleased the Lord at sundry times and in divers manners to reveal himself, and to declare that his will unto his church;",
            scriptures: "Hebrews 1:1"
        ),
        LbChapterContent(
            superscript: 4,
            text: "and afterward for the better preserving and propagating of the truth, and for the more sure establishment and comfort of the church against the corruption of the flesh, and the malice of Satan, and of the world, to commit the same wholly unto writing; which maketh the Holy Scriptures to be most necessary, those former ways of God's revealing his will unto his people being now ceased.",
            scriptures: "Proverbs 22:19-21; Romans 15:4; 2 Peter 1:19-20"
        ),
        LbChapterContent(
            superscript: 5,
            text: "Under the name of Holy Scripture, or the Word of God written, are now contained all the books of the Old and New Testaments, which are these:<br /><br /><strong>OF THE OLD TESTAMENT:</strong><br /><span class=\"d-flex flex-wrap\">(List of Old Testament books)</span><br /><br /><strong>OF THE NEW TESTAMENT:</strong><br />Matthew<br />Mark<br />Luke<br />John<br />The Acts of the Apostles<br />Paul's Epistle to the Romans<br />I Corinthians<br />II Corinthians<br />Galatians<br />Ephesians<br />Philippians<br />Colossians<br />I Thessalonians<br />II Thessalonians<br />I Timothy<br />II Timothy<br />To Titus<br />To Philemon<br />The Epistle to the Hebrews<br />Epistle of James<br />The first and second Epistles of Peter<br />The first, second, and third Epistles of John<br />The Epistle of Jude<br />The Revelation<br /><br />All of which are given by the inspiration of God, to be the rule of faith and life.",
            scriptures: "2 Timothy 3:16"
        ),
        LbChapterContent(
            superscript: 6,
            text: "The books commonly called Apocrypha, not being of divine inspiration, are no part of the canon or rule of the Scripture, and, therefore, are of no authority to the church of God, nor to be any otherwise approved or made use of than other human writings.",
            scriptures: "Luke 24:27, 44; Romans 3:2"
        ),
        LbChapterContent(
            superscript: 7,
            text: "The authority of the Holy Scripture, for which it ought to be believed, dependeth not upon the testimony of any man or church, but wholly upon God (who is truth itself), the author thereof; therefore it is to be received because it is the Word of God.",
            scriptures: "2 Peter 1:19-21; 2 Timothy 3:16; 2 Thessalonians 2:13; 1 John 5:9"
        ),
        LbChapterContent(
            superscript: 8,
            text: "We may be moved and induced by the testimony of the church of God to a high and reverent esteem of the Holy Scriptures; and the heavenliness of the matter, the efficacy of the doctrine, and the majesty of the style, the consent of all the parts, the scope of the whole (which is to give all glory to God), the full discovery it makes of the only way of man's salvation, and many other incomparable excellencies, and entire perfections thereof, are arguments whereby it doth abundantly evidence itself to be the Word of God; yet notwithstanding, our full persuasion and assurance of the infallible truth, and divine authority thereof, is from the inward work of the Holy Spirit bearing witness by and with the Word in our hearts.",
            scriptures: "John 16:13-14; 1 Corinthians 2:10-12; 1 John 2:20, 27"
        ),
        LbChapterContent(
            superscript: 9,
            text: "The whole counsel of God concerning all things necessary for his own glory, man's salvation, faith and life, is either expressly set down or necessarily contained in the Holy Scripture: unto which nothing at any time is to be added, whether by new revelation of the Spirit, or traditions of men.",
            scriptures: "2 Timothy 3:15-17; Galatians 1:8-9"
        ),
        LbChapterContent(
            superscript: 10,
            text: "Nevertheless, we acknowledge the inward illumination of the Spirit of God to be necessary for the saving understanding of such things as are revealed in the Word.",
            scriptures: "John 6:45; 1 Corinthians 2:9-12"
        ),
        LbChapterContent(
            superscript: 11,
            text: "and that there are some circumstances concerning the worship of God, and government of the church, common to human actions and societies, which are to be ordered by the light of nature and Christian prudence, according to the general rules of the Word, which are always to be observed.",
            scriptures: "1 Corinthians 11:13-14; 1 Corinthians 14:26,40"
        ),
        LbChapterContent(
            superscript: 12,
            text: "All things in Scripture are not alike plain in themselves, nor alike clear unto all;",
            scriptures: "2 Peter 3:16"
        ),
        LbChapterContent(
            superscript: 13,
            text: "yet those things which are necessary to be known, believed and observed for salvation, are so clearly propounded and opened in some place of Scripture or other, that not only the learned, but the unlearned, in a due use of ordinary means, may attain to a sufficient understanding of them.",
            scriptures: "Psalms 19:7; Psalms 119:130"
        ),
        LbChapterContent(
            superscript: 14,
            text: "The Old Testament in Hebrew (which was the native language of the people of God of old),",
            scriptures: "Romans 3:2"
        ),
        LbChapterContent(
            superscript: 15,
            text: "and the New Testament in Greek (which at the time of the writing of it was most generally known to the nations), being immediately inspired by God, and by his singular care and providence kept pure in all ages, are therefore authentic; so as in all controversies of religion, the church is finally to appeal to them.",
            scriptures: "Isaiah 8:20"
        ),
        LbChapterContent(
            superscript: 16,
            text: "But because these original tongues are not known to all the people of God, who have a right unto, and interest in the Scriptures, and are commanded in the fear of God to read,",
            scriptures: "Acts 15:15"
        ),
        LbChapterContent(
            superscript: 17,
            text: "and search them,",
            scriptures: "John 5:39"
        ),
        LbChapterContent(
            superscript: 18,
            text: "therefore they are to be translated into the vulgar language of every nation unto which they come,",
            scriptures: "1 Corinthians 14:6, 9, 11-12, 24, 28"
        ),
        LbChapterContent(
            superscript: 19,
            text: "that the Word of God dwelling plentifully in all, they may worship him in an acceptable manner, and through patience and comfort of the Scriptures may have hope.",
            scriptures: "Colossians 3:16"
        ),
        LbChapterContent(
            superscript: 20,
            text: "The infallible rule of interpretation of Scripture is the Scripture itself; and therefore when there is a question about the true and full sense of any Scripture (which is not manifold, but one), it must be searched by other places that speak more clearly.",
            scriptures: "2 Peter 1:20-21; Acts 15:15-16"
        ),
        LbChapterContent(
            superscript: 21,
            text: "The supreme judge, by which all controversies of religion are to be determined, and all decrees of councils, opinions of ancient writers, doctrines of men, and private spirits, are to be examined, and in whose sentence we are to rest, can be no other but the Holy Scripture delivered by the Spirit, into which Scripture so delivered, our faith is finally resolved.",
            scriptures: "Matthew 22:29, 31-32; Ephesians 2:20; Acts 28:23"
        )
    ]
)

let londonBaptistData = LondonBaptistData(
    slug: "1689",
    title: "1689 London Baptist Confession of Faith",
    date: "1689",
    about: LondonBaptistAbout(
        description: [
            "The 1689 London Baptist Confession of Faith was written by Calvinistic, Particular Baptists in England who desired an official statement for their beliefs.",
            "The London Baptist Confession is intentionally largely based on the Westminster Confession of Faith (1646) and the Savoy Declaration (1658). The Puritans who wrote this confession desired to demonstrate unity with Presbyterians, so they only changed specific parts of other like-minded confessions, while maintaining similar language in the rest of the confession."
        ]
    ),
    content: [preface]
)
