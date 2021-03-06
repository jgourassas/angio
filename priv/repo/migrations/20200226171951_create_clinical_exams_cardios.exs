defmodule Angio.Repo.Migrations.CreateClinicalExamsCardios do
  use Ecto.Migration

  def change do
    create table(:clinical_exams_cardios) do
      add(:cle_dt, :date)
      add(:cle_tm, :time)
      add(:cle_normal_yn, :boolean, default: false, null: false)
      add(:cle_complain_yn, :boolean, default: false, null: false)
      add(:cle_complain_dysp, :string)
      add(:cle_complain_chest_pain_yn, :boolean, default: false, null: false)
      add(:cle_complain_palpitations_yn, :boolean, default: false, null: false)
      add(:cle_complain_cough_yn, :boolean, default: false, null: false)
      add(:cle_complain_notes, :text)
      add(:cle_temperature, :string)
      add(:cle_killip_class, :string)
      add(:cle_heart_sounds_abnormal_yn, :boolean, default: false, null: false)
      add(:cle_s1_heart_sound, :string)
      add(:cle_s2_heart_sound, :string)
      add(:cle_s3_heart_sound_yn, :boolean, default: false, null: false)
      add(:cle_s4_heart_sound_yn, :boolean, default: false, null: false)
      add(:cle_peri_rub_yn, :boolean, default: false, null: false)
      add(:cle_sounds_notes, :text)
      add(:cle_mv_abnormal_yn, :boolean, default: false, null: false)
      add(:cle_mv_sys_murmur_yn, :boolean, default: false, null: false)
      add(:cle_mv_sys_murmur_grade, :string)
      add(:cle_mv_dias_murmur_yn, :boolean, default: false, null: false)
      add(:cle_mv_dias_murmur_grade, :string)
      add(:cle_mv_opening_snap_yn, :boolean, default: false, null: false)
      add(:cle_mv_prosthetic_sound_yn, :boolean, default: false, null: false)
      add(:cle_mv_notes, :text)
      add(:cle_av_abnormal_yn, :boolean, default: false, null: false)
      add(:cle_av_sys_murmur_yn, :boolean, default: false, null: false)
      add(:cle_av_sys_murmur_grade, :string)
      add(:cle_av_dias_murmur_yn, :boolean, default: false, null: false)
      add(:cle_av_dias_murmur_grade, :string)
      add(:cle_av_ejection_click_yn, :boolean, default: false, null: false)
      add(:cle_av_prosthetic_sound_yn, :boolean, default: false, null: false)
      add(:cle_no_ejection_click_yn, :boolean, default: false, null: false)
      add(:cle_continuous_murmur, :string)
      add(:cle_murmur_notes, :text)
      add(:cle_pv_abnormal_yn, :boolean, default: false, null: false)
      add(:cle_pv_sys_murmur_yn, :boolean, default: false, null: false)
      add(:cle_pv_sys_murmur_grade, :string)
      add(:cle_pv_dias_murmur_yn, :boolean, default: false, null: false)
      add(:cle_pv_dias_murmur_grade, :string)
      add(:cle_pv_notes, :text)
      add(:cle_tr_abnormal_yn, :boolean, default: false, null: false)
      add(:cle_tr_sys_murmur_yn, :boolean, default: false, null: false)
      add(:cle_tr_dias_murmur_yn, :boolean, default: false, null: false)
      add(:cle_tr_notes, :text)
      add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
      timestamps()
    end
  end
end
