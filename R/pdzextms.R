
#' pdzextms
#'
#' Main analysis script.
#'
#' @param startStage Start at a specified analysis stage (default:1)
#' @param stopStage Stop at a specified analysis stage (default:15)
#' @param base_dir Base directory for all input files (default:NB private CRG server path; change accordingly)
#' @param output_dir Output directory for all output files (default:same as base_dir)
#'
#' @return Nothing
#' @export
pdzextms <- function(
  startStage = 1,
  stopStage = 6,
  base_dir = "/users/project/prj004631/afaure/DMS/Results/pdzextms_proj",
  output_dir = ""
  ){

  # startStage=1
  # stopStage=6
  # base_dir = "/users/project/prj004631/afaure/DMS/Results/pdzextms_proj"
  # rerun_raw = F

  colour_scheme <- list(
    "shade 0" = list(
      "#F4270C",
      "#F4AD0C",
      "#1B38A6",
      "#09B636"),
    "shade 1" = list(
      "#FFB0A5",
      "#FFE4A5",
      "#9DACE3",
      "#97E9AD"),
    "shade 2" = list(
      "#FF6A56",
      "#FFCB56",
      "#4C63B7",
      "#43C766"),
    "shade 3" = list(
      "#A31300",
      "#A37200",
      "#0C226F",
      "#007A20"),
    "shade 4" = list(
      "#410800",
      "#412D00",
      "#020B2C",
      "#00300D"),
    "shade 5" = list(
      "#CCCCCC",
      "#FF991F",
      "#5CB8FF",
      "#B22222"
    ))

  #First and last analysis stages
  first_stage <- startStage
  last_stage <- stopStage

  #Default output directory
  if(output_dir==""){
    output_dir <- base_dir
  }

  ### Fit thermo models
  ###########################

  # stagenum <- 0
  # pdzextms_fit_thermo_model(
  #   base_dir = base_dir,
  #   execute = (first_stage <= stagenum & last_stage >= stagenum))

  ### Evaluate thermo model results
  ###########################

  stagenum <- 1
  #PSD95-PDZ3 only
  pdzextms_thermo_model_results(
    mochi_outpath = file.path(base_dir, "Data", "mochi", "PSD95-PDZ3"),
    literature_free_energies = file.path(base_dir, "Data", "in_vitro", "PDZ_literature_free_energies.txt"),
    position_offset = 311,
    outpath = pdzextms__format_dir(dir_suffix="_pdzextms_thermo_model_results_PSD95-PDZ3", stagenum=stagenum, base_dir=output_dir),
    colour_scheme = colour_scheme,
    execute = (first_stage <= stagenum & last_stage >= stagenum))
  #PSD95-PDZ3 Nterm extension
  pdzextms_thermo_model_results(
    mochi_outpath = file.path(base_dir, "Data", "mochi", "PSD95-PDZ3_N"),
    literature_free_energies = file.path(base_dir, "Data", "in_vitro", "PDZ_literature_free_energies.txt"),
    position_offset = 311,
    outpath = pdzextms__format_dir(dir_suffix="_pdzextms_thermo_model_results_PSD95-PDZ3_N", stagenum=stagenum, base_dir=output_dir),
    colour_scheme = colour_scheme,
    execute = (first_stage <= stagenum & last_stage >= stagenum))
  #PSD95-PDZ3 Cterm extension
  pdzextms_thermo_model_results(
    mochi_outpath = file.path(base_dir, "Data", "mochi", "PSD95-PDZ3_C"),
    literature_free_energies = file.path(base_dir, "Data", "in_vitro", "PDZ_literature_free_energies.txt"),
    position_offset = 311,
    outpath = pdzextms__format_dir(dir_suffix="_pdzextms_thermo_model_results_PSD95-PDZ3_C", stagenum=stagenum, base_dir=output_dir),
    colour_scheme = colour_scheme,
    execute = (first_stage <= stagenum & last_stage >= stagenum))
  #PSD95-PDZ3 N and Cterm extension
  pdzextms_thermo_model_results(
    mochi_outpath = file.path(base_dir, "Data", "mochi", "PSD95-PDZ3_NC"),
    literature_free_energies = file.path(base_dir, "Data", "in_vitro", "PDZ_literature_free_energies.txt"),
    position_offset = 311,
    outpath = pdzextms__format_dir(dir_suffix="_pdzextms_thermo_model_results_PSD95-PDZ3_NC", stagenum=stagenum, base_dir=output_dir),
    colour_scheme = colour_scheme,
    execute = (first_stage <= stagenum & last_stage >= stagenum))

  ### Add 3D structure metrics
  ###########################

  stagenum <- 2
  #PSD95-PDZ3 only
  pdzextms_structure_metrics(
    input_file = file.path(base_dir, paste0("001", "_pdzextms_thermo_model_results_PSD95-PDZ3"), "dg_singles.txt"),
    outpath = pdzextms__format_dir(dir_suffix="_pdzextms_structure_metrics_PSD95-PDZ3", stagenum=stagenum, base_dir=output_dir),
    pdb_file = file.path(base_dir, "Data", "pdb", "1be9.pdb"),
    execute = (first_stage <= stagenum & last_stage >= stagenum))
  #PSD95-PDZ3 Nterm extension
  pdzextms_structure_metrics(
    input_file = file.path(base_dir, paste0("001", "_pdzextms_thermo_model_results_PSD95-PDZ3_N"), "dg_singles.txt"),
    outpath = pdzextms__format_dir(dir_suffix="_pdzextms_structure_metrics_PSD95-PDZ3_N", stagenum=stagenum, base_dir=output_dir),
    pdb_file = file.path(base_dir, "Data", "pdb", "1be9.pdb"),
    execute = (first_stage <= stagenum & last_stage >= stagenum))
  #PSD95-PDZ3 Cterm extension
  pdzextms_structure_metrics(
    input_file = file.path(base_dir, paste0("001", "_pdzextms_thermo_model_results_PSD95-PDZ3_C"), "dg_singles.txt"),
    outpath = pdzextms__format_dir(dir_suffix="_pdzextms_structure_metrics_PSD95-PDZ3_C", stagenum=stagenum, base_dir=output_dir),
    pdb_file = file.path(base_dir, "Data", "pdb", "1be9.pdb"),
    execute = (first_stage <= stagenum & last_stage >= stagenum))
  #PSD95-PDZ3 N and Cterm extension
  pdzextms_structure_metrics(
    input_file = file.path(base_dir, paste0("001", "_pdzextms_thermo_model_results_PSD95-PDZ3_NC"), "dg_singles.txt"),
    outpath = pdzextms__format_dir(dir_suffix="_pdzextms_structure_metrics_PSD95-PDZ3_NC", stagenum=stagenum, base_dir=output_dir),
    pdb_file = file.path(base_dir, "Data", "pdb", "1be9.pdb"),
    execute = (first_stage <= stagenum & last_stage >= stagenum))

  ### Fitness plots
  ###########################

  # stagenum <- 3
  # #PSD95-PDZ3 and GRB2-SH3
  # pdzextms_fitness_plots(
  #   fitness_list = list(
  #     "GB1" = file.path(base_dir, "Data", "fitness", "GB1"),
  #     "PSD95-PDZ3" = file.path(base_dir, "Data", "fitness", "PSD95-PDZ3"),
  #     "GRB2-SH3" = file.path(base_dir, "Data", "fitness", "GRB2-SH3")),
  #   structure_metrics_list = list(
  #     "GB1" = file.path(base_dir, paste0("002", "_pdzextms_structure_metrics_GB1"), "dg_singles.txt"),
  #     "PSD95-PDZ3" = file.path(base_dir, paste0("002", "_pdzextms_structure_metrics_PSD95-PDZ3"), "dg_singles.txt"),
  #     "GRB2-SH3" = file.path(base_dir, paste0("002", "_pdzextms_structure_metrics_GRB2-SH3"), "dg_singles.txt")),
  #   val_inpath = file.path(base_dir, "Data", "experimental_validations", "GRB2-SH3", "experimenal_validations_ODs.txt"),
  #   outpath = pdzextms__format_dir(dir_suffix="_pdzextms_fitness_plots", stagenum=stagenum, base_dir=output_dir),
  #   colour_scheme = colour_scheme,
  #   execute = (first_stage <= stagenum & last_stage >= stagenum))
  
  ### Plot fitness heatmaps
  ###########################

  # stagenum <- 4
  # #GB1
  # pdzextms_fitness_heatmaps(
  #   input_file = file.path(base_dir, paste0("002", "_pdzextms_structure_metrics_GB1"), "dg_singles.txt"),
  #   input_file_fitness = file.path(base_dir, "Data", "fitness", "GB1"),
  #   domain_name = "GB1",
  #   outpath = pdzextms__format_dir(dir_suffix="_pdzextms_fitness_heatmaps_GB1", stagenum=stagenum, base_dir=output_dir),
  #   colour_scheme = colour_scheme,
  #   plot_width = 11,
  #   plot_traits = "Binding",
  #   execute = (first_stage <= stagenum & last_stage >= stagenum))
  # #PSD95-PDZ3
  # pdzextms_fitness_heatmaps(
  #   input_file = file.path(base_dir, paste0("002", "_pdzextms_structure_metrics_PSD95-PDZ3"), "dg_singles.txt"),
  #   input_file_fitness = file.path(base_dir, "Data", "fitness", "PSD95-PDZ3"),
  #   input_file_MSA = file.path(base_dir, "Data", "MSA", "PSD95-PDZ3", "frequencies.csv"),
  #   domain_name = "PSD95 PDZ3",
  #   outpath = pdzextms__format_dir(dir_suffix="_pdzextms_fitness_heatmaps_PSD95-PDZ3", stagenum=stagenum, base_dir=output_dir),
  #   colour_scheme = colour_scheme,
  #   plot_width = 15,
  #   execute = (first_stage <= stagenum & last_stage >= stagenum))
  # #GRB2-SH3
  # pdzextms_fitness_heatmaps(
  #   input_file = file.path(base_dir, paste0("002", "_pdzextms_structure_metrics_GRB2-SH3"), "dg_singles.txt"),
  #   input_file_fitness = file.path(base_dir, "Data", "fitness", "GRB2-SH3"),
  #   input_file_MSA = file.path(base_dir, "Data", "MSA", "GRB2-SH3", "frequencies.csv"),
  #   domain_name = "GRB2 SH3",
  #   outpath = pdzextms__format_dir(dir_suffix="_pdzextms_fitness_heatmaps_GRB2-SH3", stagenum=stagenum, base_dir=output_dir),
  #   colour_scheme = colour_scheme,
  #   plot_width = 11,
  #   execute = (first_stage <= stagenum & last_stage >= stagenum))

  ### Plot free energy scatterplots
  ###########################

  # stagenum <- 5
  # #All domains
  # pdzextms_free_energy_scatterplots(
  #   input_list = list(
  #     "GB1" = file.path(base_dir, paste0("002", "_pdzextms_structure_metrics_GB1"), "dg_singles.txt"),
  #     "PSD95-PDZ3" = file.path(base_dir, paste0("002", "_pdzextms_structure_metrics_PSD95-PDZ3"), "dg_singles.txt"),
  #     "GRB2-SH3" = file.path(base_dir, paste0("002", "_pdzextms_structure_metrics_GRB2-SH3"), "dg_singles.txt")),
  #   input_MSA_list = list(
  #     "GB1" = file.path(base_dir, "Data", "MSA", "GB1", "frequencies.csv"),
  #     "PSD95-PDZ3" = file.path(base_dir, "Data", "MSA", "PSD95-PDZ3", "frequencies.csv"),
  #     "GRB2-SH3" = file.path(base_dir, "Data", "MSA", "GRB2-SH3", "frequencies.csv")
  #   ),
  #   outpath = pdzextms__format_dir(dir_suffix="_pdzextms_free_energy_scatterplots", stagenum=stagenum, base_dir=output_dir),
  #   colour_scheme = colour_scheme,
  #   execute = (first_stage <= stagenum & last_stage >= stagenum))

  ### Plot free energy heatmaps
  ###########################

  # stagenum <- 6
  # #GB1
  # pdzextms_free_energy_heatmaps(
  #   input_file = file.path(base_dir, paste0("002", "_pdzextms_structure_metrics_GB1"), "dg_singles.txt"),
  #   domain_name = "GB1",
  #   outpath = pdzextms__format_dir(dir_suffix="_pdzextms_free_energy_heatmaps_GB1", stagenum=stagenum, base_dir=output_dir),
  #   colour_scheme = colour_scheme,
  #   plot_width = 11,
  #   execute = (first_stage <= stagenum & last_stage >= stagenum))
  # #PSD95-PDZ3
  # pdzextms_free_energy_heatmaps(
  #   input_file = file.path(base_dir, paste0("002", "_pdzextms_structure_metrics_PSD95-PDZ3"), "dg_singles.txt"),
  #   domain_name = "PSD95 PDZ3",
  #   outpath = pdzextms__format_dir(dir_suffix="_pdzextms_free_energy_heatmaps_PSD95-PDZ3", stagenum=stagenum, base_dir=output_dir),
  #   colour_scheme = colour_scheme,
  #   plot_width = 15,
  #   execute = (first_stage <= stagenum & last_stage >= stagenum))
  # #GRB2-SH3
  # pdzextms_free_energy_heatmaps(
  #   input_file = file.path(base_dir, paste0("002", "_pdzextms_structure_metrics_GRB2-SH3"), "dg_singles.txt"),
  #   domain_name = "GRB2 SH3",
  #   outpath = pdzextms__format_dir(dir_suffix="_pdzextms_free_energy_heatmaps_GRB2-SH3", stagenum=stagenum, base_dir=output_dir),
  #   colour_scheme = colour_scheme,
  #   plot_width = 11,
  #   execute = (first_stage <= stagenum & last_stage >= stagenum))

}