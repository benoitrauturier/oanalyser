% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mod_get_mistakes.R
\name{mod_register_mistake}
\alias{mod_register_mistake}
\title{Register mistakes server module}
\usage{
mod_register_mistake(input, output, session, mistake_submitted, input_val)
}
\arguments{
\item{session}{}
}
\description{
This module register the mistakes in a reactive value data frame each time the ruse presses the mistake_submitted button. It also prepares the data frame to be displayed to the user and reintialize the form.
TODO : Refacto this functio for single responsability and functionalize the rendering of the mistake form.
}
