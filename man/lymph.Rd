% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_lymph.R
\docType{data}
\name{lymph}
\alias{lymph}
\title{Lymph dataset}
\format{
A data frame with 148 rows and 19 variables:
\describe{
  \item{lymphatics}{factor, normal, arched, deformed, displaced}
  \item{block_of_affere}{factor, no, yes}
  \item{bl_of_lymph_c}{factor, no, yes}
  \item{bl_of_lymph_s}{factor, no, yes}
  \item{by_pass}{factor, no, yes}
  \item{extravasates}{factor, no, yes}
  \item{regeneration_of}{factor,no, yes}
  \item{early_uptake_in}{factor,no, yes}
  \item{lym_nodes_dimin}{numeric, 0-3}
  \item{lym_nodes_enlar}{numeric,1-4}
  \item{changes_in_lym}{factor, bean, oval, round}
  \item{defect_in_node}{factor,no, lacunar, lac. marginal, lac. central}
  \item{changes_in_node}{factor, no, lacunar, lac. margin, lac. central}
  \item{changes_in_stru}{factor,no, grainy, drop-like, coarse, diluted,
  reticular, stripped, faint}
  \item{special_forms}{factor,no, chalices, vesicles}
  \item{dislocation_of}{factor,no, yes}
  \item{exclusion_of_no}{factor,no, yes}
  \item{no_of_nodes_in}{numeric,0-9, 10-19, 20-29, 30-39, 40-49, 50-59,
  60-69, >=70}
  \item{class}{factor, normal find, metastases, malign lymph, fibrosis}
}
}
\source{
Data from openml \url{https://www.openml.org/search?type=data&status=active&id=10&sort=runs}.
}
\usage{
data(lymph)
}
\description{
\code{lymph} This lymphography domain was obtained from the University Medical
Centre, Institute of Oncology, Ljubljana, Yugoslavia. Thanks go to M. Zwitter
and M. Soklic for providing the data.
}
