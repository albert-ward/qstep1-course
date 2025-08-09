#### Leonardo Carella - January 2023 ####

#### Code to clean up the ESS wave 9 data for the Q-Step course
#### Codebook available at: https://www.europeansocialsurvey.org/docs/round9/survey/ESS9_appendix_a7_e03_1.pdf
#### Raw data downloaded as ‘ESS9 - integrated file, edition 3.1 ( CSV )’
#### from https://ess-search.nsd.no/en/study/bdc7c350-1029-4cb3-9d5e-53f668b8fa74

ess <- read.csv("ESS9e03_1.csv") %>%
  dplyr::filter(cntry == "GB")

# store in a vector remove_x the variables where x is a missing value

remove_6 <- c("prtdgcl", "gincdif", "freehms", 
              "hmsfmlsh", "hmsacld", "pdjobev", "emplrel",
              "wrkctra", "estsz", "jbspv", "wrkac6m", "uemp3m", "uemp12m",
              "uemp5yr", "mbtru",
              "recskil", "recexp", "recknow", "recimg", "recgndr",
              "sofrdst", "sofrwrk", "sofrpr", "sofrprv", "ppldsrv", 
              "jstprev", "pcmpinj")

remove_7 <- c("netusoft", "psppsgva", "actrolga",
              "psppipla", "cptppola", "contplt", 
              "wrkprty", "wrkorg", "contplt", "wrkprty", 
              "wrkorg", "badge", "sgnptit","pbldmn", 
              "bctprd", "pstplonl", "clsprty",
              "gincdif", "freehms", "hmsfmlsh", "hmsacld",
              "imsmetn", "imdfetn", "impcntr", "rlgblg",
              "aesfdrk", "hlthhmp", "brncntr", "facntr", 
              "evpdemp", "evlvptn", "bthcld", "estsz", "jbspv", 
              "wrkac6m", "uemp3m", "uemp12m", "uemp5yr", "mbtru", "hincfel",
              "frprtpl", "gvintcz", "poltran",
              "recskil", "recexp", "recknow", "recimg", "recgndr",
              "sofrdst", "sofrwrk", "sofrpr", "sofrprv", "ppldsrv", 
              "jstprev", "pcmpinj", "ipcrtiv","imprich","ipeqopt","ipshabt",
              "impsafe","impdiff","ipfrule","ipudrst",
              "ipmodst","ipgdtim","impfree","iphlppl",
              "ipsuces","ipstrgv","ipadvnt","ipbhprp",
              "iprspot","iplylfr","impenv","imptrad",
              "impfun")

remove_8 <- c("netusoft", "psppsgva", "actrolga",
              "psppipla", "cptppola", "contplt", 
              "wrkprty", "wrkorg", "contplt", "wrkprty", 
              "wrkorg", "badge", "sgnptit","pbldmn", 
              "bctprd", "pstplonl", "clsprty", "prtdgcl", "vote",
              "gincdif", "freehms", "hmsfmlsh", "hmsacld",
              "imsmetn", "imdfetn", "impcntr", "crmvct",
              "rlgblg", "sclact", "aesfdrk", "dscrgrp", 
              "ctzcntr", "brncntr", "blgetmg", "facntr", 
              "evpdemp", "evlvptn", "bthcld", "wrkctra", "estsz",
              "jbspv", "wrkac6m", "uemp3m", "uemp12m",
              "uemp5yr", "mbtru", "hincfel",
              "frprtpl", "gvintcz", "poltran",
              "recskil", "recexp", "recknow", "recimg", "recgndr",
              "sofrdst", "sofrwrk", "sofrpr", "sofrprv", "ppldsrv", 
              "jstprev", "pcmpinj",
              "ipcrtiv","imprich","ipeqopt","ipshabt",
              "impsafe","impdiff","ipfrule","ipudrst",
              "ipmodst","ipgdtim","impfree","iphlppl",
              "ipsuces","ipstrgv","ipadvnt","ipbhprp",
              "iprspot","iplylfr","impenv","imptrad",
              "impfun")

remove_9 <- c("hincfel", "frprtpl", "gvintcz", "poltran",
              "recskil", "recexp", "recknow", "recimg", "recgndr",
              "sofrdst", "sofrwrk", "sofrpr", "sofrprv", "ppldsrv", 
              "jstprev", "pcmpinj", 
              "ipcrtiv","imprich","ipeqopt","ipshabt",
              "impsafe","impdiff","ipfrule","ipudrst",
              "ipmodst","ipgdtim","impfree","iphlppl",
              "ipsuces","ipstrgv","ipadvnt","ipbhprp",
              "iprspot","iplylfr","impenv","imptrad",
              "impfun")

remove_66 <- c("prtvtcgb", "prtclcgb", "rlgdnm",
               "happy", "sclmeet", "rlgdnm", "nbthcld",
               "wkdcorga", "iorgact", "tporgwk", "iincsrc",
               "ifredu", "ifrjob", "evfredu", "evfrjob")

remove_77 <- c("ppltrst", "pplfair", "pplhlp",
               "trstprl","trstlgl","trstplc",
               "trstplt", "trstprt","trstep","trstun",
               "prtvtcgb", "prtclcgb", "lrscale",
               "stflife", "stfeco", "stfgov",
               "stfdem", "stfedu", "stfhlth", "euftf",
               "imbgeco", "imueclt", "imwbcnt", "rlgdnm",
               "happy", "sclmeet", "inprdsc", "atchctr",
               "atcherp", "rlgdnm", "rlgdgr", "rlgatnd",
               "pray", "vteumbgb", "maritalb", "eisced",
               "mnactic", "eduyrs", "iorgact", "hincsrca",
               "hinctnta", "iincsrc",
               "ifredu", "ifrjob", "evfredu", "evfrjob")

remove_88 <- c("ppltrst", "pplfair", "pplhlp",
               "trstprl","trstlgl","trstplc",
               "trstplt", "trstprt","trstep","trstun",
               "prtvtcgb", "prtclcgb", "lrscale",
               "stflife", "stfeco", "stfgov",
               "stfdem", "stfedu", "stfhlth", "euftf",
               "imbgeco", "imueclt", "imwbcnt",
               "rlgdnm", "happy", "sclmeet", "inprdsc",
               "atchctr", "atcherp", "rlgdnm", "rlgdgr", 
               "rlgatnd", "pray", "vteumbgb", "plnftr",
               "maritalb", "eisced", "mnactic", "eduyrs",
               "wkdcorga", "iorgact", "tporgwk", "hincsrca",
               "hinctnta", "iincsrc",
               "ifredu", "ifrjob", "evfredu", "evfrjob")

remove_99 <- c("rlgdnm", "maritalb", "hinctnta", "iincsrc",
               "ifredu", "ifrjob", "evfredu", "evfrjob")

remove_666 <- c("wkhct", "wkhtot", "nacer2")
remove_777<- c("wkhct", "wkhtot", "nacer2")
remove_888 <- c("wkhct", "wkhtot", "nacer2")
remove_999 <- c("wkhct", "wkhtot", "nacer2", "agea")

remove_6666 <- c("netustm", "rlgdngb", "livecnta",
                 "pdempyr", "lvpntyr", "lvptnyr",
                 "maryr", "pdjobyr")
remove_7777 <- c("rlgdngb", "livecnta", "pdempyr", 
                 "lvpntyr", "lvptnyr", "maryr", "yrbrn")
remove_8888 <- c("nwspol", "netustm", "rlgdngb",
                 "pdempyr", "lvpntyr", "lvptnyr",
                 "maryr", "yrbrn", "edagegb", "pdjobyr")
remove_9999 <- c("rlgdngb", "pdempyr", "lvpntyr",
                 "lvptnyr", "maryr", "yrbrn")

remove_66666 <- c("emplno", "njbspv", "isco08")
remove_77777 <- c("emplno", "njbspv", "isco08")
remove_88888 <- c("emplno", "njbspv", "isco08")
remove_99999 <- c("emplno", "njbspv", "isco08")

# convert missing value placeholders to NA

ess <- ess %>%
  mutate(across(all_of(remove_99), ~na_if(.,99))) %>%
  mutate(across(all_of(remove_88), ~na_if(.,88))) %>%
  mutate(across(all_of(remove_77), ~na_if(.,77))) %>%
  mutate(across(all_of(remove_66), ~na_if(.,66))) %>%
  
  mutate(across(all_of(remove_8), ~na_if(.,8))) %>%
  mutate(across(all_of(remove_9), ~na_if(.,9))) %>%
  mutate(across(all_of(remove_7), ~na_if(.,7))) %>%
  mutate(across(all_of(remove_6), ~na_if(.,6))) %>%
  
  mutate(across(all_of(remove_999), ~na_if(.,999))) %>%
  mutate(across(all_of(remove_888), ~na_if(.,888))) %>%
  mutate(across(all_of(remove_777), ~na_if(.,777))) %>%
  mutate(across(all_of(remove_666), ~na_if(.,666))) %>%
  
  mutate(across(all_of(remove_9999), ~na_if(.,9999))) %>%
  mutate(across(all_of(remove_8888), ~na_if(.,8888))) %>%
  mutate(across(all_of(remove_7777), ~na_if(.,7777))) %>%
  mutate(across(all_of(remove_6666), ~na_if(.,6666))) %>%
  
  mutate(across(all_of(remove_99999), ~na_if(.,99999))) %>%
  mutate(across(all_of(remove_88888), ~na_if(.,88888))) %>%
  mutate(across(all_of(remove_77777), ~na_if(.,77777))) %>%
  mutate(across(all_of(remove_66666), ~na_if(.,66666))) 
  
# special cases 

ess$edagegb[ess$edagegb %in% c(95,96)] <- NA
ess$ifredu[ess$ifredu %in% c(55)] <- NA
ess$eisced[ess$eisced %in% c(55)] <- NA

# Recode dummy variables to 0-1 

# variables coded as 1-2 to be recoded as 1-0 (Yes-No plus Gender)

two_is_zero <- c("contplt", "wrkprty", "wrkorg", "badge", "sgnptit", 
                 "pbldmn", "bctprd", "pstplonl", "clsprty", "crmvct",
                 "rlgblg", "dscrgrp", "ctzcntr", "brncntr", 
                 "blgetmg", "facntr", "mocntr", "evpdemp", 
                 "evlvptn", "evmar", "bthcld", "pdjobev", 
                 "jbspv", "wrkac6m", "uemp3m", "uemp12m", "uemp5yr")

ess <- ess %>%
  mutate(across(all_of(two_is_zero), 
                ~case_when(. == 1 ~ 1,
                           . == 2 ~ 0))) %>%
  mutate(gndr = gndr-1 )

# Recode character variables 

ess <- ess %>%
  dplyr::mutate(vote = dplyr::recode(as.character(vote), 
                                     "1" = "Yes",
                                     "2" = "No",
                                     "3" = "Not eligible to vote")) %>%
  dplyr::mutate(hlthhmp = dplyr::recode(as.character(hlthhmp), 
                                     "1" = "Yes a lot",
                                     "2" = "Yes to some extent",
                                     "3" = "No")) %>%
  dplyr::mutate(domicil = dplyr::recode(as.character(domicil), 
                                     "1" = "city",
                                     "2" = "suburbs",
                                     "3" = "town",
                                     "4" = "village",
                                     "5" = "countryside")) %>%
  dplyr::mutate(emplrel = dplyr::recode(as.character(emplrel), 
                                        "1" = "Employee",
                                        "2" = "Self-employed",
                                        "3" = "Working for own family business")) %>%
  dplyr::mutate(mbtru = dplyr::recode(as.character(mbtru), 
                                     "1" = "Yes, currently",
                                     "2" = "Yes, previously",
                                     "3" = "No"))
  

# Subset to relevant variables 

keep_variables <- c("idno", "cntry", "nwspol" ,"netusoft",
                    "netustm", "ppltrst", "pplfair", "pplhlp",
                    "polintr", "psppsgva" ,"actrolga",
                    "psppipla","cptppola",
                    "trstprl","trstlgl","trstplc",
                    "trstplt", "trstprt","trstep","trstun",
                    "vote", "prtvtcgb", "contplt", "wrkprty", 
                    "wrkorg", "badge", "sgnptit","pbldmn", 
                    "bctprd", "pstplonl", "clsprty", "lrscale",
                    "prtclcgb", "prtdgcl",
                    "stflife", "stfeco", "stfgov",
                    "stfdem", "stfedu", "stfhlth",
                    "gincdif", "freehms", "hmsfmlsh", "hmsacld",
                    "euftf", "imsmetn", "imdfetn", "impcntr",
                    "imbgeco", "imueclt", "imwbcnt", "happy",
                    "sclmeet", "inprdsc", "sclact", "crmvct",
                    "aesfdrk", "health", "hlthhmp", "atchctr",
                    "atcherp", "rlgblg", "rlgdnm", "rlgdngb",
                    "rlgdgr", "rlgatnd", "pray", "dscrgrp",
                    "ctzcntr", "brncntr", "livecnta", "blgetmg",
                    "facntr", "mocntr", "vteumbgb", "evpdemp",
                    "pdempyr", "lvpntyr", "evlvptn", "lvptnyr",
                    "evmar", "maryr", "bthcld", "nbthcld",
                    "plnftr", "hhmmb", "gndr", "yrbrn", "agea",
                    "maritalb", "domicil", "eisced", "edagegb",
                    "eduyrs", "mnactic", "pdjobev", "pdjobyr",
                    "emplrel", "emplno", "wrkctra", "estsz",
                    "jbspv", "njbspv", "wkdcorga", "iorgact",
                    "wkhct", "wkhtot", "nacer2", "tporgwk",
                    "isco08", "wrkac6m", "uemp3m", "uemp12m",
                    "uemp5yr", "mbtru", "hincsrca", "hinctnta", "hincfel",
                    "iincsrc", "region", "frprtpl", "gvintcz", "poltran",
                    "ifredu", "ifrjob", "evfredu", "evfrjob",
                    "recskil", "recexp", "recknow", "recimg", "recgndr",
                    "sofrdst", "sofrwrk", "sofrpr", "sofrprv", "ppldsrv", 
                    "jstprev", "pcmpinj","ipcrtiv","imprich",
                    "ipeqopt","ipshabt",
                    "impsafe","impdiff","ipfrule","ipudrst",
                    "ipmodst","ipgdtim","impfree","iphlppl",
                    "ipsuces","ipstrgv","ipadvnt","ipbhprp",
                    "iprspot","iplylfr","impenv","imptrad",
                    "impfun", "anweight")

ess <- ess %>%
  dplyr::select(keep_variables)

write.csv(ess, "ess9_gb.csv", row.names = FALSE)



