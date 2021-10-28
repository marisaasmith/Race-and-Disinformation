# Race and Disinformation

## Background

Digital information environments are often lauded for their democratizing potential. However, social media also create the perfect storm for racist, manipulative content that fosters and exploits negative attitudes towards African Americans. Such content, often in the form of disinformation, can amplify racial resentment and bolster anti-Black political narratives associating Black Americans with crime. This two-wave study will examine the effects of disinformation with anti-Black discourse on participants social and political attitudes. 

Purveyors of disinformation manipulate audiences’ perceptions of social and political matters by subtlety blending discussions of real-life events with false statistics and evaluative statements ([Faris et al., 2017](https://cyber.harvard.edu/publications/2017/08/mediacloud); [Freelon & Wells, 2020](https://doi.org/10.1080/10584609.2020.1723755)). Disinformation echoing anti-Black narratives serve the express purpose of furthering partisan agendas by delegitimizing opponents (e.g., politicians, media organizations, activists, etc.) among partisan audiences ([Bennett & Livingston, 2018, p. 125](https://doi.org/10.1177/0267323118760317)). 

## Preliminary Text Analysis

This preliminary text analysis is two-fold. First, it aims to assist in the creation of stimuli that isolates the effects of disinformation *with* explicit racial mentions. Second, it aims to boost the ecological validity of the stimuli created for the two-wave study. Experimental conditions will expose participants to crime news. Previous research indicates that crime news, particularly crime narratives depicting African Americans as criminals, sways American political support ([Valentino, 1999](https://www.jstor.org/stable/2991710)). These narratives boost beliefs that African Americans pose a significant threat to White Americans and affirm the Republican party as best suited for quashing the treat and protecting White prerogatives ([Kreiss et al., 2020](https://doi.org/10.1177/2056305120926495); see [Mendelberg, 2001](https://psycnet.apa.org/record/2001-00846-000)).

Crime news over representing African Americans as criminals can originate from various news sources, such as national or cable news (e.g., [Dixon, 2017](https://doi.org/10.1177/0093650215579223); [Dixon et al., 2003](https://doi.org/10.1207/s15506878jobem4704_2); [Dixon & Linz, 2000](https://doi.org/10.1111/j.1460-2466.2000.tb02845.x); [Dixon & Williams, 2015](https://doi.org/10.1111/jcom.12133)). However, conservative news sources may incorporate language that elucidates the flaws of liberal ideology (i.e., “soft on crime”), rendering their ideological argument “right” (Jamieson & Capella, 2008). To examine how discussions of crime diverge among partisan networks *and* how crime news may incorporate both explicit race appeals and elements of disinformation (e.g., evaluative statements, biased language), I examined news disseminated among liberal and conservative networks on Twitter. 

## Method

Since the study will focus on crime news, I first reviewed searched [PolitiFact](https://www.politifact.com/) and [FactCheck.org](https://www.factcheck.org/) for instances of fact-checked crime stories. In June 2021, there were several fact checked claims of an increase in crime between 2020 and 2021 (see "[House GOP’s Misplaced Blame for Rising Homicides](https://www.factcheck.org/2021/07/house-gops-misplaced-blame-for-rising-homicides/)" and "[Police defunding is to blame for “skyrocketing murder rates” in Philadelphia, Minneapolis, Portland, New York City, Chicago, Los Angeles and Washington, D.C.](https://www.politifact.com/factchecks/2021/may/28/facebook-posts/facebook-post-makes-unproven-claim-about-police-fu/)"). According to the fact checks, homicides are indeed on the rise. However, the claims either exaggerated the numbers and/or omitted that the rise also occurred in previous years. Since these crime stories could be manipulated to either discuss the increase in crime or discuss the increase with anti-Black, biased language, it served as the basis for the stimuli. 

Articles used for preliminary analysis were collected using the news website [Media Cloud](mediacloud.org), an open-source media ecosystem platform that tracks and curates news sources. Media Cloud includes a number of databases, including a database which curates news disseminated on Twitter within partisan networks (e.g., "[Tweeted Mostly by Followers of Liberal Politicians 2019](https://sources.mediacloud.org/#/collections/200363061)") (see [Media Cloud](https://mediacloud.org/news/2021/7/16/3-approaches-to-quantifying-us-partisanship-in-news-sources) and [Berkman Klein Center](https://cyber.harvard.edu/research/2020-election-study-resources-data)). I used a Boolean search for the keywords "(rising OR increasing OR increase OR rise ) AND (murder* OR homicide*) NOT (entertainment OR television)" on articles published between June 25, 2021 and July 30, 2021 (overlapping with the time of the fact-checked claims). Once collected, news articles were screened to only include U.S. sources ([United States - National](https://sources.mediacloud.org/#/collections/34412234) and to sources that shared original content and/or at least 10 articles on the topic. The screening process yielded 617 news articles. 

![News Sources]()

![News Sources by Partisanship]()

### Structural Topic Modeling

Structural Topic Modeling (STM) provides a quantitative mechanism for discovering topics within a corpus and estimating the relationships between these topics and the corpus' metadata (e.g., documents classifications) ([Roberts et al., 2019](https://doi.org/10.18637/jss.v091.i02)). STM was undertaken using the `stm` package in R. 

Before conducting STM, I first evaluated model performance for **K** 10-20. Calculations for held-out likelihood, semantic coherence, and exclusivity were conducted using `searchK`. Analysis reviewed that **K** = 14 would provide optimal models. First, **K** = 14 maintained a high held-out likelihood (i.e., model performance during cross-validation) without sacrificing semantic coherence (i.e., how frequently probable words in a given topic co-occur). Second, **K** = 14 maintained high exclusivity (i.e., terms exclusive to each topic) without sacrificing semantic coherence. 

![Diagnostic]()

![Semantic Coherence vs Exclusivity]()

### News Topics 

The Top Topics are listed below: 

![Top Topics]()

Topic 2, Topic 7, and Topic 1 occurred in the largest proportion of the corpus. 

![Topic 2 & Topic 7]()
![Topic 2 & Topic 7 Word Comparison]()

Topic 2 discussed crime, focusing on mentions of crime in the context of policing. For Topic 7, discussions of crime highlighted increasing rates of gun violence and murders.  

![Topic 1]()

Topic 1 discussed crime in the context of politics. Highest probability words included "democrats," "biden," and "republicans". 

### Comparison by Network 

Next, I used `estimateEffect` to determine differences in the proportion of topic prevalence (i.e., Topic 1 - Topic 14) by network. With respect to the top crime tops, analysis reviewed differences in the proportion of topic prevalence for Topic 2 and Topic 7. Right networks predicted the proportion of Topic 2 and Topic 3. In other words, news shared in "Right" networks incorporated a greater proportion of these topics than news shared within "Left" networks. The same differences occured when comparing "Center" network news to "Left" networks. 

**Topic 2:**

Coefficients:
                    Estimate Std. Error t value Pr(>|t|)   
(Intercept)          0.03944    0.03862   1.021  0.30761   
networkCenter Left   0.06484    0.04425   1.465  0.14339   
networkCenter        0.12435    0.04916   2.530  0.01167 * 
networkCenter Right  0.03351    0.05322   0.630  0.52915   
networkRight         0.12151    0.04295   2.829  0.00482 **

**Topic 7:**

Coefficients:
                    Estimate Std. Error t value Pr(>|t|)   
(Intercept)          0.02050    0.03791   0.541  0.58880   
networkCenter Left   0.08798    0.04570   1.925  0.05466 . 
networkCenter        0.14631    0.04917   2.976  0.00304 **
networkCenter Right  0.09606    0.05296   1.814  0.07020 . 
networkRight         0.11798    0.04226   2.792  0.00540 **

---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

There were also differences in the proportion of Topic 4, Topic 8, Topic 9, Topic 10, and Topic 14. Topics 4, 8, and 14 were prevalent in news shared among "Left" networks. Topics 9 and 10 were more indicative of "Right" network-shared news. 

**Topic 4:**

Coefficients:
                    Estimate Std. Error t value Pr(>|t|)    
(Intercept)          0.15019    0.03446   4.358 1.54e-05 ***
networkCenter Left  -0.05745    0.03829  -1.500 0.134069    
networkCenter       -0.07873    0.04091  -1.924 0.054755 .  
networkCenter Right -0.11902    0.04141  -2.874 0.004194 ** 
networkRight        -0.13092    0.03581  -3.656 0.000278 ***

**Topic 8:**

Coefficients:
                    Estimate Std. Error t value Pr(>|t|)    
(Intercept)          0.22560    0.02547   8.857  < 2e-16 ***
networkCenter Left  -0.18052    0.02929  -6.163 1.30e-09 ***
networkCenter       -0.20466    0.03080  -6.644 6.75e-11 ***
networkCenter Right -0.21840    0.03332  -6.555 1.18e-10 ***
networkRight        -0.21370    0.02771  -7.712 5.05e-14 ***

**Topic 9:**

Coefficients:
                    Estimate Std. Error t value Pr(>|t|)   
(Intercept)         0.010330   0.027336   0.378  0.70563   
networkCenter Left  0.008879   0.031965   0.278  0.78129   
networkCenter       0.011974   0.034124   0.351  0.72579   
networkCenter Right 0.130134   0.043663   2.980  0.00299 **
networkRight        0.071946   0.031068   2.316  0.02090 * 

**Topic 10:**

Coefficients:
                    Estimate Std. Error t value Pr(>|t|)   
(Intercept)         0.007247   0.029037   0.250  0.80300   
networkCenter Left  0.058434   0.035259   1.657  0.09798 . 
networkCenter       0.062786   0.036341   1.728  0.08455 . 
networkCenter Right 0.122476   0.045289   2.704  0.00703 **
networkRight        0.075827   0.032840   2.309  0.02128 * 

**Topic 14:**

Coefficients:
                    Estimate Std. Error t value Pr(>|t|)    
(Intercept)          0.17185    0.03588   4.790  2.1e-06 ***
networkCenter Left  -0.15043    0.04006  -3.755 0.000190 ***
networkCenter       -0.14733    0.04122  -3.574 0.000379 ***
networkCenter Right -0.16104    0.04578  -3.518 0.000467 ***
networkRight        -0.07581    0.03741  -2.027 0.043127 *  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

### Determining Bias

With knowledge of potential differences in topic discussion, the next step of analysis involved looking 
