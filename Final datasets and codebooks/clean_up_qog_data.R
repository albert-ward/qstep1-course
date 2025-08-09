#### Leonardo Carella - January 2023 ####

#### Code to clean up the QoG dataset (2022) for the Q-Step course
#### Codebook available at: https://www.qogdata.pol.gu.se/data/codebook_bas_jan22.pdf
#### Raw data ownloaded as ‘Cross-section CSV’ from https://www.gu.se/en/quality-government/qog-data/data-downloads/basic-dataset

library(countrycode)
library(tidyverse)

data <- read.csv("qog_bas_cs_jan22.csv")

#### Code Region ####

data$region <- countrycode(data$ccodealp, origin = "iso3c", destination = "un.region.name")
data$region[data$ccodealp == "TWN"] <- "Asia"

#### Code Vbs as Categorical ####

data <- data %>%
  dplyr::mutate(across(c(fh_status, fhn_fotnst, 
                         fhp_status5),
                       ~dplyr::recode(as.character(.), 
                                          "1" = "Free",
                                          "2" = "Partly Free",
                                          "3" = "Not Free")))
data <- data %>%
  dplyr::mutate(across(c(ccp_cc, ccp_childwrk, 
                         ccp_equal, ccp_freerel),
                       ~dplyr::recode(as.character(.), 
                                          "1" = "Yes",
                                          "2" = "No",
                                      "96" = "Other")))

data <- data %>%
  dplyr::mutate(gol_est = dplyr::recode(as.character(gol_est), 
                                      "1" = "Majoritarian",
                                      "2" = "Proportional",
                                      "3" = "Mixed"))


data <- data %>%
  dplyr::mutate(ccp_slave = dplyr::recode(as.character(ccp_slave), 
                                      "1" = "Universally prohibited",
                                      "2" = "Prohibited except in the case of war",
                                   "3" = "Prohibited with other exception(s)",
                                   "90" = "Left explicitly to non-constitutional law",
                                   "96" = "Other",
                                   "98" = "Not specified")) %>%
  dplyr::mutate(ccp_strike = dplyr::recode(as.character(ccp_strike), 
                                          "1" = "Yes",
                                          "2" = "Yes, but with limitations",
                                          "3" = "No",
                                          "96" = "Other"))

keep_variables <- c("cname", "ccodealp", "region", "bicc_gmi", "bl_asyf",
                    "bl_asym", "bl_asymf", "bmr_dem", "bmr_demdur",
                    "bti_aar", "bti_acp", "bti_aod", "bti_cdi", "bti_ci", 
                    "bti_cps", "bti_cr", "bti_ds", "bti_eo", "bti_eos", 
                    "bti_ep", "bti_ffe", "bti_foe", "bti_ij", "bti_mes", 
                    "bti_muf", "bti_pdi", "bti_pp", "bti_prp", "bti_ps", 
                    "bti_rol", "bti_sdi", "bti_seb", "bti_sel", "bti_sop", 
                    "bti_ssn", "bti_su", "bti_wr", "ccp_cc", "ccp_childwrk", 
                    "ccp_equal", "ccp_freerel", "ccp_slave", "ccp_strike",
                    "cspf_sfi", "dr_eg", "dr_ig", "dr_pg", "dr_sg",
                    "ef_ef", "egov_egov", "epi_eh", "epi_epi",
                    "fh_aor", "fh_cl", "fh_ep", "fh_feb", "fh_fog", 
                    "fh_ipolity2", "fh_pair", "fh_pr", "fh_rol", 
                    "fh_status", "fhn_fotnsc", "fhn_fotnst", "fhp_score5", 
                    "fhp_status5", "fi_ftradeint", "fi_index", "gcb_br",
                    "gcb_fcwell", "gcb_orcag", "gcb_pcbmost", "gcb_pcjmost", 
                    "gcb_pclgcmost", "gcb_pclmost", "gcb_pcori", "gcb_pcpmost", 
                    "gcb_pcpolmost", "gcb_pcrmost", "gcb_pctaxmost", "gcb_pfcaag", 
                    "gcb_sarcag", "gcb_wsdag", "gd_ptsa", "gd_ptsh", "gii_gii",
                    "gol_enep", "gol_est", "gol_est_spec", "gol_pr", "h_j", "gpi_gpi",
                    "ht_colonial", "ht_region", "ibp_obi", "ideavt_legvt",
                    "ideavt_presvt", "ipu_l_sw", "ipu_u_sw", "jht_ccc",
                    "jht_ccd", "lp_lat_abst", "lp_legor", "mad_gdppc", "mad_gdppc1900",
                    "p_durable", "p_polity2", "pei_eir", "pei_peii", "pwt_hci",
                    "pwt_pop", "ti_cpi", "top_top10_income_share", "top_top1_income_share",
                    "undp_hdi", "van_index", "vdem_corr", "vdem_delibdem", "vdem_egaldem",
                    "vdem_gender", "vdem_libdem", "vdem_mecorrpt", "vdem_partipdem", 
                    "vdem_polyarchy", "voh_gti", "wbgi_cce", "wbgi_gee", "wbgi_pve", 
                    "wbgi_rle", "wdi_acel", "wdi_acelr", "wdi_acelu", "wdi_afp", "wdi_agedr", "wdi_ane", "wdi_araland", 
                    "wdi_area", "wdi_armexp", "wdi_armimp", "wdi_birth", "wdi_bribfirm", "wdi_broadb", 
                    "wdi_busden", "wdi_co2", "wdi_death", "wdi_debt", "wdi_eduprp", "wdi_eduprs", 
                    "wdi_elerenew", "wdi_elprodcoal", "wdi_elprodgas", "wdi_elprodhyd", "wdi_elprodnuc", 
                    "wdi_elprodoil", "wdi_emp", "wdi_empagr", "wdi_empagrf", "wdi_empagrm", 
                    "wdi_empind", "wdi_empindf", "wdi_empindm", "wdi_empser", "wdi_empserf", 
                    "wdi_empserm", "wdi_eneimp", "wdi_eodb", "wdi_expedu", "wdi_expeduge", 
                    "wdi_expedup", "wdi_expedus", "wdi_expedut", "wdi_expmil", "wdi_fdiin", 
                    "wdi_fdiout", "wdi_fertility", "wdi_firftopm", "wdi_firgifttax", "wdi_forest", 
                    "wdi_fossil", "wdi_gdpagr", "wdi_gdpcapcon2010", "wdi_gdpind", "wdi_gerp", 
                    "wdi_gerpp", "wdi_gers", "wdi_gert", "wdi_gini", "wdi_homicides", 
                    "wdi_idpdis", "wdi_idpvc", "wdi_idpvp", "wdi_imig", "wdi_infpay", 
                    "wdi_internet", "wdi_lfpf", "wdi_lifexp", "wdi_lifexpf", "wdi_lifexpm", 
                    "wdi_litrad", "wdi_litradf", "wdi_litradm", "wdi_litry", "wdi_migration", 
                    "wdi_nerp", "wdi_ners", "wdi_pop", "wdi_pop14", "wdi_pop1564", 
                    "wdi_pop65", "wdi_popden", "wdi_poprul", "wdi_popurb", "wdi_povgap190", 
                    "wdi_refasy", "wdi_refori", "wdi_semp", "wdi_smokf", "wdi_smokm", 
                    "wdi_spr", "wdi_tacpsr", "wdi_taxrev", "wdi_tele", "wdi_trade", 
                    "wdi_unempfilo", "wdi_unempilo", "wdi_unempmilo", "wdi_unempyfilo", "wdi_unempyilo", 
                    "wdi_unempymilo", "wdi_wip", "wef_ci", "wef_elec", "wef_gci",
                    'wef_mobile', "wef_oc", "wef_pr", "wef_qoi", "wef_wlf", "who_halet",
                    "who_sanittot", "whr_hap", "yri_yri35")

data <- data %>% dplyr::select(all_of(keep_variables))

write.csv(data, "qog2022.csv", row.names = FALSE)
