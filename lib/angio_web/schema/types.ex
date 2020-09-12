defmodule AngioWeb.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Angio.Repo
  import_types(Absinthe.Type.Custom)
  #####################################

  ###########################
  object :definition do
    field(:id, :id)
    field(:table_name, :string)
    field(:name, :string)
    field(:coding_instructions, :string)
    field(:target_value, :string)
    field(:support_definition, :string)
    field(:notes, :string)
    field(:ref, :string)
    field(:title_name, :string)
    field(:default_value, :string)
    field(:usual_range, :string)
    field(:valid_range, :string)
    field(:data_source, :string)

    field(:defs_options, list_of(:defs_option), resolve: assoc(:defs_options))
    field(:defs_sentences, list_of(:defs_sentence), resolve: assoc(:defs_sentences))
    field(:defs_codes, list_of(:defs_code), resolve: assoc(:defs_codes))
  end

  ##############################
  object :defs_code do
    field(:code, :string)
    field(:code_system, :string)
    field(:definition_id, :integer)
    field(:description, :string)
    field(:note, :string)
  end

  ###########################
  object :defs_option do
    field(:id, :id)
    field(:name, :string)
    field(:code, :string)
    field(:selection_text, :string)
    field(:selection_notes, :string)
    field(:selection_definition, :string)
    field(:definition_id, :id)
    field(:definition, :definition, resolve: assoc(:definition))
    field(:opts_sentences, list_of(:opts_sentence), resolve: assoc(:opts_sentences))
    field(:opts_codes, list_of(:opts_code), resolve: assoc(:opts_codes))
  end

  ###################################
  object :opts_sentence do
    field(:id, :id)
    field(:definition_id, :integer)
    field(:language, :string)
    field(:note, :string)
    field(:sentence, :string)
    field(:defs_option_id, :integer)
    field(:defs_option, :defs_option, resolve: assoc(:defs_option))
  end

  ############################
  object :opts_code do
    field(:id, :id)
    field(:code, :string)
    field(:code_system, :string)
    field(:definition_id, :integer)
    field(:defs_option_id, :integer)
    field(:description, :string)
    field(:notes, :string)
  end

  ###############################
  object :language do
    field(:alpha2, :string)
    field(:english, :string)
  end

  #########################
  object :defs_sentence do
    field(:id, :id)
    field(:language, :string)
    field(:sentence, :string)
    field(:note, :string)
    field(:definition_id, :id)
    field(:definition, :definition, resolve: assoc(:definition))
  end

  ####################################
  object :patient do
    field(:patnts_last_name, :string)
    field(:patient_other_id, :string)
    field(:patnts_birth_dt, :date)
    field(:patnts_deceased, :boolean)
    field(:patnts_ethnicity_hispanic, :boolean)
    field(:patnts_father_name, :string)
    field(:patnts_first_name, :string)
    field(:patnts_gender, :string)
    field(:patnts_language_preferred, :string)
    field(:patnts_middle_name, :string)
    field(:patnts_mother_name, :string)
    field(:patnts_notes, :string)
    field(:patnts_race, :string)
    field(:patnts_record_active, :boolean)
    field(:patnts_ssn, :string)
    field(:patnts_ssn_na, :boolean)
    field(:treadmill_exercises, list_of(:treadmill_exercise), resolve: assoc(:treadmill_exercises))
    field(:info_coronaries, list_of(:info_coronary), resolve: assoc(:info_coronaries))
  end


  ####check again jgour
  input_object :patient_input do
    field(:patnts_last_name, non_null(:string))
    field(:patnts_first_name, non_null(:string))
    field(:patnts_ssn, non_null(:string))
  end

  ########################
  object :info_coronary do
    field(:id, :id)
    field(:cor_les_count, :string)
    field(:icd10cm_code_1, :string)
    field(:icd10cm_code_2, :string)
    field(:icd10cm_code_3, :string)
    field(:icd10cm_code_4, :string)
    field(:info_cor_anomalies_yn, :boolean)
    field(:info_cor_arrival_dt, :date)
    field(:info_cor_arrival_tm, :time)
    field(:info_cor_cabg_prior_dt, :date)
    field(:info_cor_date, :date)
    field(:info_cor_diagnostic_status, :string)
    field(:info_cor_dis_ves_num, :string)
    field(:info_cor_end_tm, :time)
    field(:info_cor_grafts_dis_yn, :boolean)
    field(:info_cor_grafts_implanted_num, :string)
    field(:info_cor_grafts_patent_num, :string)
    field(:info_cor_grafts_yn, :boolean)
    field(:info_cor_main_reason, :string)
    field(:info_cor_normal_natives_yn, :boolean)
    field(:info_cor_notes, :string)
    field(:info_cor_prior_interv_yn, :boolean)
    field(:info_cor_rx_recommend, :string)
    field(:info_cor_start_tm, :time)
    field(:info_exam_num, :string)
    field(:patient_id, :integer)

    field(:cor_lesions, list_of(:cor_lesion), resolve: assoc(:cor_lesions))
    field(:cath_grafts, list_of(:cath_graft), resolve: assoc(:cath_grafts))
    field(:cor_collaterals, list_of(:cor_collateral), resolve: assoc(:cor_collaterals))
    field(:cor_anatomies, list_of(:cor_anatomy), resolve: assoc(:cor_anatomies))
    field(:lventricles, list_of(:lventricle), resolve: assoc(:lventricles))
    field(:cath_events, list_of(:cath_event), resolve: assoc(:cath_events))
    field(:cath_meds, list_of(:cath_med), resolve: assoc(:cath_meds))
    field(:cath_radiations, list_of(:cath_radiation), resolve: assoc(:cath_radiations))
    field(:proc_episodes, list_of(:proc_episode), resolve: assoc(:proc_episodes))
    field(:cath_clinicals, list_of(:cath_clinical), resolve: assoc(:cath_clinicals))
    field(:asd_closures, list_of(:asd_closure), resolve: assoc(:asd_closures))
    field(:chd_conditions, list_of(:chd_condition), resolve: assoc(:chd_conditions))
    field(:chd_risk_factors, list_of(:chd_risk_factor), resolve: assoc(:chd_risk_factors))
    field(:electrocardiograms, list_of(:electrocardiogram), resolve: assoc(:electrocardiograms))
    field(:infect_histories, list_of(:infect_history), resolve: assoc(:infect_histories))
    field(:functional_states, list_of(:functional_state), resolve: assoc(:functional_states))
    field(:av_plasties, list_of(:av_plasty), resolve: assoc(:av_plasties))
    field(:coarc_procedures, list_of(:coarc_procedure), resolve: assoc(:coarc_procedures))
    field(:pci_procedures, list_of(:pci_procedure), resolve: assoc(:pci_procedures))

    field(:clinical_exams_cardios, list_of(:clinical_exam_cardio),
      resolve: assoc(:clinical_exams_cardios)
    )
  end

  #############################
  object :cath_clinical do
    field(:id, :id)
    field(:anesthitist_called_yn, :boolean)
    field(:anesthitist_at_start_yn, :boolean)
    field(:angina_class_within_2wk_yn, :boolean)
    field(:bag_mask_ventilation_yn, :boolean)
    field(:cabg_most_recent_dt, :date)
    field(:cad_presentation_type, :string)
    field(:cardio_shock_last_24hours_yn, :boolean)
    field(:cath_cl_arrest_hypothermia_dt, :date)
    field(:cath_cl_arrest_hypothermia_tm, :time)
    field(:cath_cl_arrest_hypothermia_yn, :boolean)
    field(:cath_cl_arrest_loc, :string)
    field(:cath_cl_arrest_pre_wit_yn, :boolean)
    field(:cath_cl_iabp_start_dt, :date)
    field(:cath_cl_symptom_onset_dt, :date)
    field(:chf_prior_2wk_yn, :boolean)
    field(:glasgow_coma_scale, :string)
    field(:iabp_start_tm, :time)
    field(:iabp_support_req_yn, :boolean)
    field(:intubated_before_cath_yn, :boolean)
    field(:lv_dysfunction_yn, :boolean)
    field(:mech_lv_support_other_dt, :date)
    field(:mech_lv_support_other_tm, :time)
    field(:mech_lv_support_other_yn, :boolean)
    field(:nyha_class_prior_2wk_cath_yn, :boolean)
    field(:nyha_prior_2wk_category, :string)
    field(:sedation_type, :string)
    field(:symptom_onset_tm, :time)
    field(:symptom_onset_tm_estim, :boolean)
    field(:symptom_onset_tm_na, :boolean)
    field(:ventilator_support_yn, :boolean)
    field(:arrest_cardiac_24h_yn, :boolean)
    field(:cath_cl_notes, :string)
    field(:info_coronary_id, :integer)
  end

  #######################
  object :proc_episode do
    field(:id, :id)
    field(:proc_epis_art_access_l_brachial, :string)
    field(:proc_epis_art_access_l_femoral, :string)
    field(:proc_epis_art_access_l_radial, :string)
    field(:proc_epis_art_access_r_brachial, :string)
    field(:proc_epis_art_access_r_femoral, :string)
    field(:caepsds_art_access_r_radial, :string)
    field(:proc_epis_catheter_l_name, :string)
    field(:proc_epis_catheter_l_size, :string)
    field(:proc_epis_catheter_lv_name, :string)
    field(:proc_epis_catheter_lv_size, :string)
    field(:proc_epis_catheter_r_name, :string)
    field(:proc_epis_catheter_r_size, :string)
    field(:proc_epis_closure_device, :string)
    field(:proc_epis_contrast_name, :string)
    field(:proc_epis_contrast_volume, :string)
    field(:proc_epis_cor_machine, :string)
    field(:proc_epis_cor_machine_id, :string)
    field(:proc_epis_cor_machine_loc, :string)
    field(:proc_epis_icd10_pcs_1, :string)
    field(:proc_epis_icd10_pcs_2, :string)
    field(:proc_epis_icd10_pcs_3, :string)
    field(:proc_epis_icd10_pcs_4, :string)
    field(:proc_epis_notes, :string)
    field(:proc_epis_prim_operator_lname, :string)
    field(:proc_epis_prim_operator_mname, :string)
    field(:proc_epis_prim_operator_npi, :string)
    field(:proc_epis_prim_operetor_fname, :string)
    field(:proc_epis_refer_person, :string)
    field(:proc_epis_request_dt, :date)
    field(:proc_epis_request_tm, :time)
    field(:info_coronary_id, :integer)
  end

  ##############################
  object :cath_radiation do
    field(:id, :id)
    field(:car_area_product_units, :string)
    field(:car_comulative_kerma, :string)
    field(:car_dose_area_meas_method, :string)
    field(:car_dose_area_product, :string)
    field(:car_fluoro_time, :string)
    field(:car_notes, :string)
    field(:patient_id, :integer)
    field(:info_coronary_id, :integer)
  end

  ###########################

  object :cath_med do
    field(:id, :id)
    field(:cmed_atropine_yn, :boolean)
    field(:cmed_antiarrhythmics_yn, :boolean)
    field(:cmed_ca_channel_pre_yn, :boolean)
    field(:cmed_gp_iib_iiia_yn, :boolean)

    field(:cmed_ranolazine_yn, :boolean)
    field(:cmed_inotrops_yn, :boolean)
    field(:cmed_bblocker_yn, :boolean)
    field(:cmed_statin_yn, :boolean)
    field(:cmed_lmwh_yn, :boolean)
    field(:cmed_pde_inhibitor_yn, :boolean)
    field(:cmed_direct_thrombin, :string)
    field(:cmed_anticoagulants_yn, :boolean)
    field(:cmed_anti_anginal_other_yn, :boolean)
    field(:cmed_ufh_dose, :string)
    field(:cmed_lytics_bolus_tm, :time)
    field(:cmed_no_statin_agent_yn, :boolean)
    field(:cmed_ufh_yn, :boolean)
    field(:cmed_thienopyridines, :string)
    field(:cmed_anti_anginal_yn, :boolean)
    field(:cmed_nitrates_long_act_yn, :boolean)
    field(:cmed_vaso_dilators_yn, :boolean)
    field(:cmed_lytics_bolus_dt, :date)
    field(:cmed_antiplatelets_yn, :boolean)
    field(:cmed_notes, :string)
    field(:cmed_arb_yn, :boolean)
    field(:cmed_xa_inhibitors, :string)
    field(:cmed_ace_yn, :boolean)
    field(:cmed_antihypertensives_yn, :boolean)
    field(:cmed_lytics_yn, :boolean)
    field(:cmed_aspirin_yn, :boolean)
    field(:cmed_medications_other_yn, :boolean)
    field(:cmed_prostaglandins_yn, :boolean)
    field(:cmed_diuretics_yn, :boolean)
    field(:info_coronary_id, :integer)
  end

  ##########################
  object :cath_event do
    field(:id, :id)
    field(:cath_ev_shock_start_yn, :boolean)
    field(:cath_ev_expired_yn, :boolean)
    field(:cath_ev_shock_new_post_yn, :boolean)
    field(:cath_ev_tamponate_yn, :boolean)
    field(:cath_ev_stroke_prior_yn, :boolean)
    field(:cath_ev_chf_new_post_yn, :boolean)
    field(:cath_ev_bleed_gi_yn, :boolean)
    field(:cath_ev_av_fistula_yn, :boolean)
    field(:cath_ev_shock_cath_induced_yn, :boolean)
    field(:cath_ev_valve_injury_yn, :boolean)
    field(:cath_ev_blood_transfusion_yn, :boolean)
    field(:uni_currently_on_dialysis, :boolean)
    field(:cath_ev_vasc_compl_yn, :boolean)
    field(:cath_ev_for_cabg_indication, :string)
    field(:cath_ev_cor_art_thrombus_yn, :boolean)
    field(:cath_ev_cardiac_perforation_yn, :boolean)
    field(:cath_ev_death_at_proc_yn, :boolean)
    field(:cath_ev_event_yn, :boolean)
    field(:cath_event_notes, :string)
    field(:uni_dialysis_new_req_dt, :date)
    field(:cath_ev_vasc_pseudoaneurysm_yn, :boolean)
    field(:cath_ev_cor_art_dissection_yn, :boolean)
    field(:cath_ev_hb_prior_transfer, :boolean)
    field(:cath_ev_hematoma_treat, :string)
    field(:uni_dialysis_new_req_yn, :boolean)
    field(:cath_ev_bleed_yn, :boolean)
    field(:cath_ev_header, :string)
    field(:cath_ev_stroke_new_24h_yn, :boolean)
    field(:cath_ev_stroke_new_hemo_yn, :boolean)
    field(:cath_ev_cabg_dt, :date)
    field(:cath_ev_cor_art_perforation_yn, :boolean)

    field(:res_term_infarction_type, :string)
    field(:cath_ev_vasc_dissection_yn, :boolean)
    field(:cath_ev_bleed_gu_yn, :boolean)
    # field(:cath_ev_bleed_dt_tm_utc, :utc_datetime)
    field(:cath_ev_heart_block_yn, :boolean)
    field(:cath_ev_hematoma_at_access_yn, :boolean)
    # field :uni_bleed_barc_class, :string
    field(:cath_ev_bleed_dt, :date)
    field(:cath_ev_vasc_limb_ischemia_yn, :boolean)
    field(:cath_ev_bleed_retroperi_yn, :boolean)
    field(:cath_ev_cardioversion_yn, :boolean)
    field(:cath_ev_bleed_tm, :time)
    field(:cath_ev_infarction_yn, :boolean)
    field(:cath_ev_for_cabg_status, :string)
    # field(:cath_ev_cabg_dt_tm_utc, :utc_datetime)
    field(:cath_ev_cabg_location, :string)
    field(:cath_ev_hematoma_size, :string)
    field(:cath_ev_cor_vein_dissection_yn, :boolean)
    field(:cath_ev_cabg_tm, :time)
    field(:cath_ev_bleed_other_yn, :boolean)
    field(:cath_ev_prior_mi_yn, :boolean)
    field(:cath_ev_bleed_access_yn, :boolean)
    field(:cath_ev_stroke_new_yn, :boolean)
    field(:uni_cardiac_perforation_site, :string)
    field(:info_coronary_id, :integer)
  end

  #####################
  object :lventricle do
    field(:id, :id)

    field(:cath_lv_ef_method, :string)
    field(:cath_lv_ef_val, :string)
    field(:cath_lv_heart_rate, :string)
    field(:cath_lv_lao_apical_septal, :string)
    field(:cath_lv_lao_basal_septal, :string)
    field(:cath_lv_lao_inf_lat, :string)
    field(:cath_lv_lao_post_lat, :string)
    field(:cath_lv_lao_super_lat, :string)
    field(:cath_lv_lv_pres_end_dias, :string)
    field(:cath_lv_lv_pres_sys, :string)
    field(:cath_lv_mvr, :string)
    field(:cath_lv_normal_yn, :boolean)
    field(:cath_lv_rao_antero_basal, :string)
    field(:cath_lv_rao_antero_lat, :string)
    field(:cath_lv_rao_apical, :string)
    field(:cath_lv_rao_diaphragmatic, :string)
    field(:cath_lv_rao_post_basal, :string)
    field(:cath_lv_wall_seg_func, :string)
    field(:info_coronary_id, :integer)
    field(:cath_lv_notes, :string)
    field(:aortic_pres_sys, :string)
    field(:aortic_pres_dia, :string)
  end

  ############################
  object :cor_lesion do
    field(:id, :id)
    field(:cor_les_pct, :string)
    field(:cor_les_major_branch, :string)
    field(:cor_les_seg_ncdr, list_of(:string))
    field(:cor_les_seg_cdisc, list_of(:string))
    field(:cor_les_seg_sts, list_of(:string))
    field(:cor_les_vessel_size, :string)
    field(:cor_les_type_scai, :string)
    field(:cor_les_type_aha, :string)
    field(:cor_les_length, :string)
    field(:cor_les_chronic_total_yn, :boolean)
    field(:cor_les_calcium_yn, :boolean)
    field(:cor_les_thrombus_yn, :boolean)
    field(:cor_les_bifurcation_yn, :boolean)
    field(:cor_les_tandem_yn, :boolean)
    field(:cor_les_aneurysm_yn, :boolean)
    field(:cor_les_protected_yn, :boolean)
    field(:cor_les_graft_pct, :string)
    field(:cor_les_prior_treated_yn, :boolean)
    field(:cor_les_prior_treated_dt, :date)
    field(:cor_les_prior_stent_yn, :boolean)
    field(:cor_les_stent_dt, :date)
    field(:cor_les_stent_pct, :string)
    field(:cor_les_ffr, :string)
    field(:cor_les_ivus, :string)
    field(:cor_les_counter, :integer)
    field(:patient_id, :integer)
    field(:info_coronary_id, :integer)
    field(:cor_les_ostial_loc_yn, :boolean)
    field(:cor_les_prior_treated_other, :string)
    field(:cor_les_notes, :string)
  end

  ########################

  #######################
  object :cath_graft do
    field(:id, :id)
    field(:graft_prox_sten_prior_treated_dt, :date)
    field(:graft_ostial_sten_ivus, :string)
    field(:graft_prox_sten_ivus, :string)
    field(:graft_mid_sten_device_present_yn, :boolean)
    field(:graft_dist_sten_prior_treated_dt, :date)
    field(:graft_mid_sten_prior_treated_yn, :boolean)
    field(:cath_graft_conduit_type, :string)
    field(:graft_prox_sten_ffr, :string)
    field(:graft_dist_anast_sten_yn, :boolean)
    field(:graft_index, :string)
    field(:cath_graft_segments_sts, list_of(:string))
    field(:graft_total_occlusion_yn, :boolean)
    field(:graft_dist_sten_yn, :boolean)
    field(:graft_mid_sten_yn, :boolean)
    field(:graft_prox_sten_yn, :boolean)
    field(:graft_ostial_sten_ffr, :string)
    field(:graft_dist_sten_ivus, :string)
    field(:graft_morphology, :string)
    field(:graft_mid_sten_ffr, :string)
    field(:cath_graft_header, :string)
    field(:graft_dist_anast_sten_ffr, :string)
    field(:graft_dist_sten_ffr, :string)
    field(:graft_dist_anast_type, :string)
    field(:graft_ostial_prior_treated_dt, :date)
    field(:graft_dist_sten_prior_treated_yn, :boolean)
    field(:graft_dist_sten_device_present_yn, :boolean)
    field(:graft_ostial_prior_treated_yn, :boolean)
    field(:graft_mid_sten_prior_treated_dt, :date)
    field(:graft_prox_sten_device_present_yn, :boolean)
    field(:graft_ostial_sten_pct, :string)
    field(:cath_graft_prox_site, :string)
    field(:graft_dist_anast_prior_treated_yn, :boolean)
    field(:patient_id, :integer)
    field(:graft_ostial_sten_yn, :boolean)
    field(:cath_graft_segments_ncdr, list_of(:string))
    field(:graft_dist_anast_device_present_yn, :boolean)
    field(:graft_sten_yn, :boolean)
    field(:cath_graft_segments_main_vessel, :string)
    field(:graft_ostial_device_present_yn, :boolean)
    field(:graft_dist_anast_sten_pct, :string)
    field(:graft_prox_sten_pct, :string)
    field(:graft_notes, :string)
    field(:graft_mid_sten_ivus, :string)
    field(:cath_graft_segments_cdisc, list_of(:string))
    field(:graft_prox_sten_prior_treated_yn, :boolean)
    field(:graft_dist_anast_sten_ivus, :string)
    field(:graft_dist_sten_pct, :string)
    field(:graft_mid_sten_pct, :string)
    field(:info_coronary_id, :integer)
  end

  #####################
  object :cor_collateral do
    field(:id, :id)
    field(:collat_donor_seg, :string)
    field(:collat_flow_idx_calc_yn, :boolean)
    field(:collat_flow_idx_method, :string)
    field(:collat_flow_idx_result, :string)
    field(:collat_notes, :string)
    field(:collat_qualitative_class, :string)
    field(:collat_recipient_seg, :string)
    field(:collat_rentrop_grade, :string)
    field(:collat_via_seg, :string)
    field(:collat_yn, :boolean)
    field(:info_coronary_id, :integer)
    field(:patient_id, :integer)
  end

  ############################
  object :cor_anatomy do
    field(:id, :id)
    field(:cor_anat_anomalies_yn, :boolean)
    field(:cor_anat_conus_type, :string)
    field(:cor_anat_dominance, :string)
    field(:cor_anat_lad_d1_type, :string)
    field(:cor_anat_lad_d2_type, :string)
    field(:cor_anat_lad_d3_type, :string)
    field(:cor_anat_lad_distal_type, :string)
    field(:cor_anat_lad_mid_type, :string)
    field(:cor_anat_lad_ostium_type, :string)
    field(:cor_anat_lad_prox_type, :string)
    field(:cor_anat_lcx_distal_type, :string)
    field(:cor_anat_lcx_mid_type, :string)
    field(:cor_anat_lcx_om1_type, :string)
    field(:cor_anat_lcx_om2_type, :string)
    field(:cor_anat_lcx_om3_type, :string)
    field(:cor_anat_lcx_ostium_type, :string)
    field(:cor_anat_lcx_prox_type, :string)
    field(:cor_anat_lcx_type, :string)
    field(:cor_anat_lm_ostium_type, :string)
    field(:cor_anat_lm_type, :string)
    field(:cor_anat_notes, :string)
    field(:cor_anat_pl_type, :string)
    field(:cor_anat_ramus_type, :string)
    field(:cor_anat_rca_distal_type, :string)
    field(:cor_anat_rca_mid_type, :string)
    field(:cor_anat_rca_ostium_type, :string)
    field(:cor_anat_rca_pda_type, :string)
    field(:cor_anat_rca_rv_branch_type, :string)
    field(:cor_anat_rca_type, :string)
    field(:cor_anat_septal_ostium_type, :string)
    field(:cor_anat_sino_atrial_type, :string)
    field(:cor_anat_variations_yn, :boolean)
    field(:info_coronary_id, :integer)
  end

  #############################
  object :chd_care_episode do
    field(:id, :id)
    field(:chd_arrival_dt, :date)
    field(:chd_cath_prior_recent_dt, :date)
    field(:chd_cath_proc_recent_1_id, :string)
    field(:chd_cath_proc_recent_2_id, :string)
    field(:chd_cath_proc_recent_3_id, :string)
    field(:chd_cath_proc_recent_4_id, :string)
    field(:chd_cath_proc_recent_id, list_of(:string))
    field(:chd_caths_prior_num, :string)
    field(:chd_caths_prior_yn, :boolean)
    field(:chd_country_of_residence, :string)
    field(:chd_episode_notes, :string)
    field(:chd_gestational_age, :string)
    field(:chd_premature_birth_yn, :boolean)
    field(:chd_pt_international_yn, :boolean)
    field(:chd_research_study_yn, :boolean)
    field(:chd_surg_prior_1_id, :string)
    field(:chd_surg_prior_2_id, :string)
    field(:chd_surg_prior_3_id, :string)
    field(:chd_surg_prior_4_id, :string)
    field(:chd_surg_prior_id, list_of(:string))
    field(:chd_surg_prior_num, :string)
    field(:chd_surg_prior_yn, :boolean)
    field(:chd_surg_recent_dt, :date)
    field(:chd_weight_at_birth, :string)
    field(:pt_restriction_yn, :boolean)
    field(:uni_hic_num, :string)
    field(:uni_insurance, :string)
    field(:uni_insurance_non_us, :boolean)
    field(:info_coronary_id, :integer)
  end

  #################################
  object :chd_condition do
    field(:id, :id)
    field(:chd_conditions_notes, :string)
    field(:chd_diaphragm_hernia_yn, :boolean)
    field(:chd_heterotaxy_yn, :boolean)
    field(:chd_rubella_prior_yn, :boolean)
    field(:chd_syndrome_alagille_yn, :boolean)
    field(:chd_syndrome_digeorge_yn, :boolean)
    field(:chd_syndrome_down_yn, :boolean)
    field(:chd_syndrome_marfan_yn, :boolean)
    field(:chd_syndrome_noonan_yn, :boolean)
    field(:chd_syndrome_turner_yn, :boolean)
    field(:chd_syndrome_williams_yn, :boolean)
    field(:chd_trisomy_13_yn, :boolean)
    field(:chd_trisomy_18_yn, :boolean)
    field(:info_coronary_id, :integer)
  end

  ##############################
  object :asd_closure do
    field(:id, :id)
    field(:asdcl_aortic_rim_length, :string)
    field(:asdcl_asd_size, :string)
    field(:asdcl_atria_septal_aneurysm_yn, :string)
    field(:asdcl_bal_sizing_perfomed_yn, :boolean)
    field(:asdcl_defect_counter_assoc, :string)
    field(:asdcl_defect_not_treated, :string)
    field(:asdcl_device_used_outcome, :string)
    field(:asdcl_device_utilized_id, :string)
    field(:asdcl_device_utilized_name, :string)
    field(:asdcl_ivc_rim_length, :string)
    field(:asdcl_multi_fenestrated_yn, :boolean)
    field(:asdcl_notes, :string)
    field(:asdcl_operator_fname, :string)
    field(:asdcl_operator_lname, :string)
    field(:asdcl_operator_mname, :string)
    field(:asdcl_operator_npi, :string)
    field(:asdcl_primary_indication, :string)
    field(:asdcl_residual_shunt_size, :string)
    field(:asdcl_rim_meas_performed_yn, :boolean)
    field(:asdcl_stop_flow_performed_yn, :boolean)
    field(:asdcl_stretch_diam_perform_yn, :boolean)
    field(:asdcl_stretched_diam_size, :string)
    field(:asdcl_total_septal_length, :string)
    field(:asdcl_treat_attempted_yn, :boolean)
    field(:info_coronary_id, :integer)
  end

  #######################
  object :chd_risk_factor do
    field(:id, :id)
    field(:chd_arrhythmia_history, list_of(:string))
    field(:chd_cardiomyopathy_history, :string)
    field(:chd_cardiomyopathy_yn, :boolean)
    field(:chd_chronic_lung_disease_yn, :boolean)
    field(:chd_coagulation_disorder_yn, :boolean)
    field(:chd_diabetes_yn, :boolean)
    field(:chd_endocarditis_yn, :boolean)
    field(:chd_heart_transplant_yn, :boolean)
    field(:chd_hepatic_disease_yn, :boolean)
    field(:chd_hf_1_month_yn, :boolean)
    field(:chd_hyper_coagulable_state_yn, :boolean)
    field(:chd_hypo_coagulable_state_yn, :boolean)
    # field(:chd_ischemic_heart_disease_yn, :boolean)
    field(:chd_ischemic_heart_disease_yn, :boolean)
    field(:chd_kawasaki_yn, :boolean)
    field(:chd_nyha, :string)
    field(:chd_renal_insufficiency_yn, :boolean)
    field(:chd_rheumatic_heart_disease_yn, :boolean)
    field(:chd_risk_factors_notes, :string)
    field(:chd_seizure_disorder_yn, :boolean)
    field(:chd_sickle_cell_anemia_yn, :boolean)
    field(:chd_stroke_prior_yn, :boolean)
    field(:info_coronary_id, :integer)
  end

  object :electrocardiogram do
    field(:id, :id)
    field(:ecg_av_conduction, :string)
    field(:ecg_dt, :date)
    field(:ecg_epsilon_wave_yn, :boolean)
    field(:ecg_first_tm, :time)
    field(:ecg_heart_rate, :string)
    field(:ecg_infarct_pattern_location, :string)
    field(:ecg_infarct_pattern_yn, :boolean)
    field(:ecg_inverted_t_waves_yn, :boolean)
    field(:ecg_lbbb, :string)
    field(:ecg_lv_hypertrophy, :string)
    field(:ecg_normal_yn, :boolean)
    field(:ecg_notes, :string)
    field(:ecg_p_duration_val, :string)
    field(:ecg_pathological_q_yn, :boolean)
    field(:ecg_pr_interval_val, :string)
    field(:ecg_qrs_duration_val, :string)
    field(:ecg_qtc_long_yn, :boolean)
    field(:ecg_rbbb_yn, :boolean)
    field(:ecg_rhythm, :string)
    field(:ecg_rv_hypertrophy_yn, :boolean)
    field(:ecg_st_depression_yn, :boolean)
    field(:ecg_st_elevation_yn, :boolean)
    field(:ecg_st_with_symptoms, :string)
    field(:ecg_t_with_symptoms, :string)
    field(:ecg_tm, :time)
    field(:ecg_with_symptoms_yn, :boolean)
    field(:info_coronary_id, :integer)
  end

  ##############################
  object :core_history do
    field(:id, :id)
    field(:coh_tobacco_type, :string)
    field(:coh_prior_cor_interv_yn, :boolean)
    field(:coh_hypertension_yn, :boolean)
    field(:coh_chf_etiology, :string)
    field(:coh_tobacco_cigarette_amount, :string)
    field(:coh_diabetes_therapy, :string)
    field(:coh_peripheral_art_dis_yn, :boolean)
    field(:coh_chronic_kidney_dis, :string)
    field(:coh_contrast_allergy_yn, :boolean)
    field(:coh_prior_sten_50pct_yn, :boolean)
    field(:coh_tobacco_use, :string)
    field(:coh_mascular_dis_yn, :boolean)
    field(:coh_chf_prior_yn, :boolean)
    field(:coh_diabetes_yn, :boolean)
    field(:coh_arthritis_collagen_dis_yn, :boolean)
    field(:coh_cardiomyo, :string)
    field(:coh_cur_on_dyalisis_yn, :boolean)
    field(:coh_cancer_type, :string)
    field(:coh_renal_artery_dis_yn, :boolean)
    field(:coh_cancer_history_yn, :boolean)
    field(:coh_fatigue_yn, :boolean)
    field(:coh_prior_afib_yn, :boolean)
    field(:coh_angina_yn, :boolean)
    field(:coh_prior_mi_yn, :boolean)
    field(:coh_arrest_cardiac_yn, :boolean)
    field(:coh_histories_notes, :string)
    field(:coh_copd_yn, :boolean)
    field(:coh_chf_hosp_timeframe, :string)
    field(:coh_family_diabetes_yn, :boolean)
    field(:coh_cerebrovasc_dis_yn, :boolean)
    field(:coh_dyslipidemia_yn, :boolean)
    field(:coh_family_cor_dis_yn, :boolean)
    field(:coh_angina_class, :string)
    field(:coh_mi_timeframe, :string)
    field(:coh_stroke_ischemic_yn, :boolean)
    field(:coh_chf_symptom_duration, :string)
    field(:info_coronary_id, :integer)
  end

  object :infect_history do
    field(:id, :id)
    field(:infh_endocarditis_type, :string)
    field(:infh_endocarditis_yn, :boolean)
    field(:infh_hepatitis_b_yn, :boolean)
    field(:infh_hepatitis_c_yn, :boolean)
    field(:infh_histories_notes, :string)
    field(:infh_hiv_yn, :boolean)
    field(:infh_influenza_vacc_dt, :date)
    field(:infh_influenza_vacc_yn, :boolean)
    field(:infh_malaria_yn, :boolean)
    field(:infh_pneumococcal_vacc_dt, :date)
    field(:infh_pneumococcal_vacc_yn, :boolean)
    field(:infh_pneumonia_yn, :boolean)
    field(:infh_tubercolosis_yn, :boolean)
    field(:info_coronary_id, :integer)
  end

  #########################
  object :proc_history do
    field(:id, :id)
    field(:proc_epis_request_dt, :date)
    field(:proch_cabg_prior_dt, :date)
    field(:proch_cabg_prior_yn, :boolean)
    field(:proch_cardiac_surg_other_yn, :boolean)
    field(:proch_carotid_surg_stent_dt, :date)
    field(:proch_carotid_surg_stent_yn, :boolean)
    field(:proch_notes, :string)
    field(:proch_pacer_prior_dt, :date)
    field(:proch_pacer_prior_yn, :boolean)
    field(:proch_pci_prior_dt, :date)
    field(:proch_pci_prior_yn, :boolean)
    field(:proch_prior_icd_dt, :date)
    field(:proch_prior_icd_yn, :boolean)
    field(:proch_prior_rv_biopsy_dt, :date)
    field(:proch_prior_rv_biopsy_yn, :boolean)
    field(:proch_prior_valve_interv_dt, :date)
    field(:proch_prior_valve_interv_yn, :boolean)
    field(:proch_transplant_prior_dt, :date)
    field(:proch_transplant_prior_yn, :boolean)
    field(:info_coronary_id, :integer)
  end

  ##########################
  object :social_history do
    field(:id, :id)
    field(:soh_alcohol_depend, :string)
    field(:soh_alcohol_depend_amount, :string)
    field(:soh_depressed_mood_yn, :boolean)
    field(:soh_education_level, :string)
    field(:soh_employ_status, :string)
    field(:soh_erectile_dysfunc_yn, :boolean)
    field(:soh_illicit_drug_yn, :boolean)
    field(:soh_life_expect_1yr_yn, :boolean)
    field(:soh_marital_status, :string)
    field(:soh_notes, :string)
    field(:soh_sleep_apnea_on_cpap_yn, :boolean)
    field(:soh_sleep_apnea_yn, :boolean)
    field(:info_coronary_id, :integer)
  end

  ######################################
  object :functional_state do
    field(:id, :id)
    field(:funs_basic_adl, :string)
    field(:funs_cognition_level, :string)
    field(:funs_frailty_scale_csha, :string)
    field(:funs_katz_index, :string)
    field(:funs_kccq12_score, :string)
    field(:funs_notes, :string)
    field(:funs_status_assess_dt, :date)
    field(:funs_stroke_rankin_dt, :date)
    field(:funs_stroke_rankin_modified, :string)
    field(:funs_walking_level, :string)
    field(:info_coronary_id, :integer)
  end

  #########################
  object :clinical_exam_cardio do
    field(:id, :id)
    field(:cle_mv_prosthetic_sound_yn, :boolean)
    field(:cle_tr_abnormal_yn, :boolean)
    field(:cle_pv_dias_murmur_grade, :string)
    field(:cle_normal_yn, :boolean)
    field(:cle_killip_class, :string)
    field(:cle_peri_rub_yn, :boolean)
    field(:cle_pv_abnormal_yn, :boolean)
    field(:cle_pv_sys_murmur_yn, :boolean)
    field(:cle_mv_notes, :string)
    field(:cle_complain_notes, :string)
    field(:cle_no_ejection_click_yn, :boolean)
    field(:cle_av_dias_murmur_yn, :boolean)
    field(:cle_complain_yn, :boolean)
    field(:cle_mv_opening_snap_yn, :boolean)
    field(:cle_av_sys_murmur_grade, :string)
    field(:cle_s4_heart_sound_yn, :boolean)
    field(:cle_murmur_notes, :string)
    field(:cle_complain_cough_yn, :boolean)
    field(:cle_pv_notes, :string)
    field(:cle_mv_dias_murmur_yn, :boolean)
    field(:cle_av_prosthetic_sound_yn, :boolean)
    field(:cle_av_dias_murmur_grade, :string)
    field(:cle_mv_sys_murmur_yn, :boolean)
    field(:cle_av_abnormal_yn, :boolean)
    field(:cle_mv_sys_murmur_grade, :string)
    field(:cle_tr_dias_murmur_yn, :boolean)
    field(:cle_av_sys_murmur_yn, :boolean)
    field(:cle_mv_dias_murmur_grade, :string)
    field(:cle_dt, :date)
    field(:cle_complain_dysp, :string)
    field(:cle_pv_dias_murmur_yn, :boolean)
    field(:cle_tr_sys_murmur_yn, :boolean)
    field(:cle_s1_heart_sound, :string)
    field(:cle_continuous_murmur, :string)
    field(:cle_s3_heart_sound_yn, :boolean)
    field(:cle_mv_abnormal_yn, :boolean)
    field(:cle_temperature, :string)
    field(:cle_s2_heart_sound, :string)
    field(:cle_heart_sounds_abnormal_yn, :boolean)
    field(:cle_complain_palpitations_yn, :boolean)
    field(:cle_tr_notes, :string)
    field(:cle_tm, :time)
    field(:cle_complain_chest_pain_yn, :boolean)
    field(:cle_pv_sys_murmur_grade, :string)
    field(:cle_av_ejection_click_yn, :boolean)
    field(:cle_sounds_notes, :string)
  end

  ###################################

  object :av_plasty do
    field(:id, :id)
    field(:avp_av_ann_diam_us, :string)
    field(:avp_av_morphology, :string)
    field(:avp_av_reg_degree_pre, :string)
    field(:avp_dt, :date)
    field(:avp_notes, :string)
    field(:avp_operator_fname, :string)
    field(:avp_operator_lname, :string)
    field(:avp_operator_mname, :string)
    field(:avp_operator_npi, :string)
    field(:avp_peak_sys_gradient_pre, :string)
    field(:avp_primary_indication, :string)
    field(:avp_tm, :time)
  end

  #######################
  object :coarc_procedure do
    field(:id, :id)
    field(:coarc_ao_obstruction_post_sys_gradient, :string)
    field(:coarc_ao_obstruction_pre_sys_gradient, :string)
    field(:coarc_aortic_obstruction_yn, :boolean)
    field(:coarc_arch_treated_yn, :boolean)
    field(:coarc_asdcl_operator_fname, :string)
    field(:coarc_asdcl_operator_mname, :string)
    field(:coarc_asdcl_operator_npi, :string)
    field(:coarc_dt, :date)
    field(:coarc_min_diam_post_proc, :string)
    field(:coarc_min_diam_pre_proc, :string)
    field(:coarc_nature, :string)
    field(:coarc_nature_post_prior_treatment, :string)
    field(:coarc_note, :string)
    field(:coarc_operator_lname, :string)
    field(:coarc_peak_sys_gradient_post, :string)
    field(:coarc_peak_sys_gradient_pre, :string)
    field(:coarc_primary_indication, :string)
    field(:coarc_tm, :time)
  end

  #################

  object :treadmill_exercise do
    field(:id, :id)
    field(:ext_medications_yn, :boolean)
    field(:ext_stopping_reason_notes, :string)
    field(:ext_stop_reason_other_yn, :boolean)
    field(:ext_angina_severe_post_yn, :boolean)
    field(:ext_cardio_shock_post_yn, :boolean)
    field(:ext_cpx_vo2_ventilatory_response, :string)
    field(:ext_lab_num, :string)
    field(:ext_heart_rate_at_max_st_depres, :string)
    field(:ext_referral_person, :string)
    field(:ext_st_depres_recovery_location, :string)
    field(:ext_cpr_post_yn, :boolean)
    field(:ext_compl_other_yn, :boolean)
    field(:ext_heart_rate_max_predicted, :string)
    field(:ext_vt_post_yn, :boolean)
    field(:ext_indication_notes, :string)
    field(:ext_afib_pre_yn, :boolean)
    field(:ext_st_depres_max, :string)
    field(:ext_stages_completed, :string)
    field(:ext_anginal_meds_yn, :boolean)
    field(:ext_technician_lname, :string)
    field(:ext_t_wave_inversion_pre_yn, :boolean)
    field(:ext_qrs_morphology_pre, list_of(:string))
    field(:ext_bradycardia_post_yn, :boolean)
    field(:ext_lab_yr, :string)
    field(:ext_main_problem_notes, :string)
    field(:ext_bp_diast_max, :string)
    field(:ext_ecg_normal_pre_yn, :boolean)
    field(:ext_heart_rate_achieved, :string)
    field(:ext_mets, :string)
    field(:ext_limitations, :string)
    field(:ext_bp_diast_recovery, :string)
    field(:ext_pvc_pre_yn, :boolean)
    field(:ext_duke_score, :string)
    field(:ext_mi_post_yn, :boolean)
    field(:ext_doctor_fname, :string)
    field(:ext_need_hold_handrails_yn, :boolean)
    field(:ext_st_slop_max, :string)
    field(:ext_main_problem_pulm_yn, :boolean)
    field(:ext_recommendations, :string)
    field(:ext_st_depres_pre_val, :string)
    field(:ext_qwaves_pre, :string)
    field(:ext_cad_pretest_probability, :string)
    field(:ext_complication_yn, :boolean)
    field(:ext_on_digoxin_yn, :boolean)
    field(:ext_mortality_cad_risk, :string)
    field(:ext_cpx_age_vo2, :string)
    field(:ext_heart_rate_rest, :string)
    field(:ext_bp_sys_rest, :string)
    field(:ext_st_depres_max_duration, :string)
    field(:ext_compl_notes, :string)
    field(:ext_athens_score, :string)
    field(:ext_on_bblockers_yn, :boolean)
    field(:ext_main_problem_medical_yn, :boolean)
    field(:ext_aerobic_capacity_max, :string)
    field(:ext_cpx_ve_vco2_slope, :string)
    field(:ext_borg_scale, :string)
    field(:ext_compl_afib_post_yn, :boolean)
    field(:ext_dt, :date)
    field(:ext_lab_id, :string)
    field(:ext_stop_reason_angina_yn, :boolean)
    field(:ext_bp_diast_rest, :string)
    field(:ext_st_depres_recovery_val, :string)
    field(:ext_not_done_reason, :string)
    field(:ext_st_elevation_max, :string)
    field(:ext_lv_hypertrophy_pre_yn, :boolean)
    field(:ext_limitations_relative, :string)
    field(:ext_cpx_peak_mets, :string)
    field(:ext_main_problem_cardiac_yn, :boolean)
    field(:ext_bp_sys_recovery, :string)
    field(:ext_technician_fname, :string)
    field(:ext_result_notes, :string)
    field(:ext_indication, :string)
    field(:ext_is_done_yn, :boolean)
    field(:ext_notes, :string)
    field(:ext_cpx_peak_vo2, :string)
    field(:ext_doctor_lname, :string)
    field(:ext_va_treadmill_score, :string)
    field(:ext_watts, :string)
    field(:ext_bp_sys_max, :string)
    field(:ext_tm, :time)
    field(:ext_consent_yn, :boolean)
    field(:ext_st_depres_max_location, :string)
    field(:ext_result, :string)
    field(:ext_stop_reason, :string)
    field(:ext_st_depres_pre_yn, :boolean)
    field(:ext_protocole_used, :string)
    field(:patient_id, :integer)
  end

  #######################
  object :pci_procedure do
    field(:id, :id)
    field(:pci_proc_syndax_score, :string)
    field(:pci_proc_notes, :string)
    field(:pci_proc_50pct_rca_yn, :boolean)
    field(:pci_proc_operator_mname, :string)
    field(:pci_proc_status, :string)
    field(:pci_proc_stents_implanted_num, :string)
    field(:pci_proc_contrast_volume, :string)
    field(:pci_proc_50pct_lm_yn, :boolean)
    field(:pci_proc_device_deployed_yn, :boolean)
    field(:pci_proc_lab_out_tm, :time)
    field(:pci_proc_fluoro_dose, :string)
    field(:pci_proc_lv_ef_pre_val, :string)
    field(:pci_proc_operator_npi, :string)
    field(:pci_proc_surg_consult_yn, :boolean)
    field(:pci_proc_multivessel_yn, :boolean)
    field(:pci_proc_stents_used_num, :string)
    field(:pci_proc_closure_device, :string)
    field(:pci_proc_lab_arrive_tm, :time)
    field(:pci_proc_50pct_graft_yn, :boolean)
    field(:pci_proc_status_stemi, :string)
    field(:pci_proc_fluoro_tm, :string)
    field(:pci_proc_lv_ef_pre_na, :boolean)
    field(:pci_proc_stemi_onset_dt, :date)
    field(:pci_proc_dev_first_activ_tm, :time)
    field(:pci_proc_stemi_onset_tm, :time)
    field(:pci_proc_device_first_activ_dt, :date)
    field(:pci_proc_status_acs, :string)
    field(:pci_proc_operator_lname, :string)
    field(:pci_proc_machine_id, :string)
    field(:pci_proc_50pct_lcx_yn, :boolean)
    field(:pci_proc_les_attempt_num, :string)
    field(:pci_proc_entry, :string)
    field(:pci_proc_ballons_used_num, :string)
    field(:pci_proc_primary_transfer_yn, :boolean)
    field(:pci_proc_indication, :string)
    field(:pci_proc_les_treated_num, :string)
    field(:pci_proc_success_yn, :boolean)
    field(:pci_proc_lab_arrive_dt, :date)
    field(:pci_proc_operator_fname, :string)
    field(:pci_proc_lab_num, :string)
    field(:pci_proc_50pct_lad_yn, :boolean)
    field(:pci_proc_surg_consult, :string)
    field(:pci_proc_multivessel_result, :string)
  end

  ################################
  enum :sort_order do
    value(:asc)
    value(:desc)
  end

  #############################

  ########################
end
