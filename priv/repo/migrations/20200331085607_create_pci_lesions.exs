defmodule Angio.Repo.Migrations.CreatePciLesions do
  use Ecto.Migration

  def change do
    create table(:pci_lesions) do
      add(:pci_les_counter, :string)
      add(:pci_les_gw_cossed_yn, :boolean, default: false, null: false)
      add(:pci_les_success_yn, :boolean, default: false, null: false)
      add(:pci_les_main_technique, :string)
      add(:pci_les_de_novo_yn, :boolean, default: false, null: false)
      add(:pci_les_in_native_yn, :boolean, default: false, null: false)
      add(:pci_les_in_graft_yn, :boolean, default: false, null: false)
      add(:pci_les_culprit_yn, :boolean, default: false, null: false)
      add(:pci_les_bifurc_sb_treat_yn, :boolean, default: false, null: false)
      add(:pci_les_rest_no_prior_stent_yn, :boolean, default: false, null: false)
      add(:pci_les_prior_treat_stent_yn, :boolean, default: false, null: false)
      add(:pci_les_status_stent_thrombus, :string)
      add(:pci_les_status_isr_yn, :boolean, default: false, null: false)
      add(:pci_les_status_isr_stent_type, :string)
      add(:pci_les_status_isr_duration, :string)
      add(:pci_les_status_isr_class, :string)
      add(:pci_les_prior_stent_thromb_yn, :boolean, default: false, null: false)
      add(:pci_les_prior_stent_for_isr_yn, :boolean, default: false, null: false)
      add(:pci_les_status, :string)
      add(:pci_les_complexity, :string)
      add(:pci_les_length, :string)
      add(:pci_les_aha_type, :string)
      add(:pci_les_calcium_yn, :boolean, default: false, null: false)
      add(:pci_les_cto_yn, :boolean, default: false, null: false)
      add(:pci_les_bifurcation_yn, :boolean, default: false, null: false)
      add(:pci_les_prior_treated_yn, :boolean, default: false, null: false)
      add(:pci_les_prior_stent_type, :string)
      add(:pci_les_prior_treat_timeframe, :string)
      add(:pci_les_sten_pct_pre, :string)
      add(:pci_les_timi_flow_pre, :string)
      add(:pci_les_sten_pct_post, :string)
      add(:pci_les_timi_flow_post, :string)
      add(:pci_les_stented_yn, :boolean, default: false, null: false)
      add(:pci_les_direct_stenting_yn, :boolean, default: false, null: false)
      add(:pci_les_stent_type, :string)
      add(:pci_les_des_type, :string)
      add(:pci_les_stent_length_total, :string)
      add(:pci_les_stent_1_diam, :string)
      add(:pci_les_stent_1_len, :string)
      add(:pci_les_stent_1_code, :string)
      add(:pci_les_stent_2_diam, :string)
      add(:pci_les_stent_2_len, :string)
      add(:pci_les_stent_2_code, :string)
      add(:pci_les_stent_3_diam, :string)
      add(:pci_les_stent_3_len, :string)
      add(:pci_les_stent_3_code, :string)
      add(:pci_les_stent_4_diam, :string)
      add(:pci_les_stent_4_len, :string)
      add(:pci_les_stent_4_code, :string)
      add(:pci_les_balloon_size_pre, :string)
      add(:pci_les_balloon_type_pre, :string)
      add(:pci_les_balloon_size_post, :string)
      add(:pci_les_balloon_type_post, :string)
      add(:pci_les_balloon_pres_post, :string)
      add(:pci_les_event_yn, :boolean, default: false, null: false)
      add(:pci_lesev_dissection_yn, :boolean, default: false, null: false)
      add(:pci_lesev_dissection_type, :string)
      add(:pci_lesev_perforation_yn, :boolean, default: false, null: false)
      add(:pci_lesev_perforation_class, :string)
      add(:pci_lesev_perforation_treat, :string)
      add(:pci_lesev_acute_clossure_yn, :boolean, default: false, null: false)
      add(:pci_lesev_acute_clossure_treat, :string)
      add(:pci_les_branch_occlusion_yn, :boolean, default: false, null: false)
      add(:pci_lesev_hosp_stent_thrombosis_category, :string)
      add(:pci_lesev_re_interven_yn, :boolean, default: false, null: false)
      add(:pci_les_no_reflow_yn, :boolean, default: false, null: false)
      add(:pci_les_no_reflow_type, :string)
      add(:pci_les_no_reflow_treat, :string)
      add(:pci_les_involved_seg_cdisc, {:array, :string})
      add(:pci_les_involved_seg_ncdr, {:array, :string})
      add(:pci_les_involved_seg_sts, {:array, :string})
      add(:pci_les_after_graft_type, :string)
      add(:pci_les_graft_prox_site, :string)
      add(:pci_les_graft_segments_cdisc, :string)
      add(:pci_les_graft_segments_ncdr, :string)
      add(:pci_les_graft_segments_sts, :string)
      add(:pci_les_graft_segment_pos, :string)
      add(:pci_les_graft_conduit_type, :string)
      add(:pci_les_guide_types, :string)
      add(:pci_les_guide_size, :string)
      add(:pci_les_device_counter, :string)
      add(:pci_les_devices_used, :string)
      add(:pci_les_embolic_protect_type, :string)
      add(:pci_les_notes, :text)
      add(:pci_procedure_id, references(:pci_procedures, on_delete: :delete_all))
      timestamps()
    end
  end
end