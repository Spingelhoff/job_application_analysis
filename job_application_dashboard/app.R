library(shiny)
library(survival)

experiment_data <- structure(list(Application.Date = c("01/01/2024", "01/01/2024",
"01/01/2024", "01/01/2024", "02/01/2024", "02/01/2024", "02/01/2024",
"02/01/2024", "03/01/2024", "03/01/2024", "03/01/2024", "03/01/2024",
"04/01/2024", "04/01/2024", "04/01/2024", "04/01/2024", "05/01/2024",
"05/01/2024", "05/01/2024", "05/01/2024", "06/01/2024", "06/01/2024",
"06/01/2024", "06/01/2024", "07/01/2024", "07/01/2024", "07/01/2024",
"07/01/2024", "08/01/2024", "08/01/2024", "08/01/2024", "08/01/2024",
"09/01/2024", "09/01/2024", "09/01/2024", "09/01/2024", "10/01/2024",
"10/01/2024", "10/01/2024", "10/01/2024", "11/01/2024", "11/01/2024",
"11/01/2024", "11/01/2024", "12/01/2024", "12/01/2024", "12/01/2024",
"12/01/2024", "13/01/2024", "13/01/2024", "13/01/2024", "13/01/2024",
"14/01/2024", "14/01/2024", "14/01/2024", "14/01/2024", "15/01/2024",
"15/01/2024", "15/01/2024", "15/01/2024", "16/01/2024", "16/01/2024",
"16/01/2024", "16/01/2024", "17/01/2024", "17/01/2024", "17/01/2024",
"17/01/2024", "18/01/2024", "18/01/2024", "18/01/2024", "18/01/2024",
"19/01/2024", "19/01/2024", "19/01/2024", "19/01/2024", "20/01/2024",
"20/01/2024", "20/01/2024", "20/01/2024", "21/01/2024", "21/01/2024",
"21/01/2024", "21/01/2024", "22/01/2024", "22/01/2024", "22/01/2024",
"22/01/2024", "23/01/2024", "23/01/2024", "23/01/2024", "23/01/2024",
"24/01/2024", "24/01/2024", "24/01/2024", "24/01/2024", "25/01/2024",
"25/01/2024", "25/01/2024", "25/01/2024", "26/01/2024", "26/01/2024",
"26/01/2024", "26/01/2024", "27/01/2024", "27/01/2024", "27/01/2024",
"27/01/2024", "28/01/2024", "28/01/2024", "28/01/2024", "28/01/2024",
"29/01/2024", "29/01/2024", "29/01/2024", "29/01/2024", "30/01/2024",
"30/01/2024", "30/01/2024", "30/01/2024"), Condition = c("E1A",
"E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A",
"E1B", "E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A", "E1B",
"E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B",
"E1A", "E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B", "E1A",
"E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A",
"E1B", "E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A", "E1B",
"E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B",
"E1A", "E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B", "E1A",
"E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A",
"E1B", "E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A", "E1B",
"E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B",
"E1A", "E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B", "E1A",
"E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A",
"E1B", "E1B"), Replicate = c(1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L,
1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L,
1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L,
1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L,
1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L,
1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L,
1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L,
1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L
), Job = 1:120, Company = 121:240, Response = c(0L, 0L, 0L, 1L,
0L, 0L, 0L, 0L, 0L, 0L, 0L, 1L, 0L, 0L, 0L, 0L, 1L, 1L, 0L, 1L,
0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 1L, 0L, 1L, 0L, 0L,
0L, 0L, 0L, 0L, 0L, 1L, 0L, 0L, 0L, 0L, 1L, 1L, 0L, 0L, 0L, 0L,
0L, 0L, 1L, 0L, 1L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 1L, 0L,
0L, 0L, 0L, 0L, 0L, 0L, 1L, 0L, 0L, 0L, 0L, 1L, 0L, 0L, 1L, 0L,
0L, 0L, 0L, 0L, 0L, 1L, 1L, 1L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 1L, 0L, 0L, 0L, 1L, 1L,
0L, 0L, 0L, 1L), Response.Date = c("21/01/2024", "24/01/2024",
"20/01/2024", "15/01/2024", "20/01/2024", "15/01/2024", "13/01/2024",
"12/01/2024", "22/01/2024", "25/01/2024", "24/01/2024", "22/01/2024",
"24/01/2024", "15/01/2024", "27/01/2024", "22/01/2024", "28/01/2024",
"18/01/2024", "16/01/2024", "25/01/2024", "27/01/2024", "27/01/2024",
"21/01/2024", "21/01/2024", "01/02/2024", "22/01/2024", "31/01/2024",
"30/01/2024", "28/01/2024", "21/01/2024", "27/01/2024", "31/01/2024",
"29/01/2024", "30/01/2024", "26/01/2024", "31/01/2024", "26/01/2024",
"20/01/2024", "01/02/2024", "03/02/2024", "22/01/2024", "23/01/2024",
"03/02/2024", "03/02/2024", "01/02/2024", "23/01/2024", "31/01/2024",
"06/02/2024", "05/02/2024", "27/01/2024", "03/02/2024", "27/01/2024",
"24/01/2024", "29/01/2024", "31/01/2024", "01/02/2024", "03/02/2024",
"26/01/2024", "27/01/2024", "26/01/2024", "06/02/2024", "09/02/2024",
"28/01/2024", "30/01/2024", "02/02/2024", "09/02/2024", "31/01/2024",
"06/02/2024", "30/01/2024", "30/01/2024", "03/02/2024", "08/02/2024",
"12/02/2024", "11/02/2024", "10/02/2024", "05/02/2024", "02/02/2024",
"31/01/2024", "13/02/2024", "08/02/2024", "11/02/2024", "05/02/2024",
"12/02/2024", "07/02/2024", "05/02/2024", "16/02/2024", "02/02/2024",
"11/02/2024", "04/02/2024", "11/02/2024", "04/02/2024", "02/02/2024",
"03/02/2024", "05/02/2024", "06/02/2024", "14/02/2024", "08/02/2024",
"05/02/2024", "06/02/2024", "17/02/2024", "11/02/2024", "17/02/2024",
"11/02/2024", "13/02/2024", "19/02/2024", "14/02/2024", "19/02/2024",
"12/02/2024", "13/02/2024", "08/02/2024", "13/02/2024", "14/02/2024",
"08/02/2024", "18/02/2024", "16/02/2024", "14/02/2024", "21/02/2024",
"24/02/2024", "19/02/2024", "17/02/2024"), Interview = c(0L,
0L, 0L, 1L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 1L,
0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 1L, 0L, 0L, 0L, 0L, 0L, 0L,
0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 1L, 0L, 0L, 0L, 0L, 0L, 0L,
0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
0L, 1L, 0L, 0L, 0L, 0L, 0L), Interview.Date = c("", "", "", "26/01/2024",
"", "", "", "", "", "", "", "", "", "", "", "", "05/02/2024",
"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
"", "", "", "", "", "", "", "", "", "20/02/2024", "", "", "",
"", "", "", "", "", "", "", "", "", "", "", "", "11/02/2024",
"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
"", "", "", "", "", "", "", "29/02/2024", "", "", "", "", ""),
    Notes = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,
    NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,
    NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,
    NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,
    NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,
    NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,
    NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,
    NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,
    NA, NA, NA)), class = "data.frame", row.names = c(NA, -120L
))

event_data <- structure(list(Date = c("01/01/2024", "01/01/2024", "01/01/2024",
"01/01/2024", "02/01/2024", "02/01/2024", "02/01/2024", "02/01/2024",
"03/01/2024", "03/01/2024", "03/01/2024", "03/01/2024", "04/01/2024",
"04/01/2024", "04/01/2024", "04/01/2024", "05/01/2024", "05/01/2024",
"05/01/2024", "05/01/2024", "06/01/2024", "06/01/2024", "06/01/2024",
"06/01/2024", "07/01/2024", "07/01/2024", "07/01/2024", "07/01/2024",
"08/01/2024", "08/01/2024", "08/01/2024", "08/01/2024", "09/01/2024",
"09/01/2024", "09/01/2024", "09/01/2024", "10/01/2024", "10/01/2024",
"10/01/2024", "10/01/2024", "11/01/2024", "11/01/2024", "11/01/2024",
"11/01/2024", "12/01/2024", "12/01/2024", "12/01/2024", "12/01/2024",
"13/01/2024", "13/01/2024", "13/01/2024", "13/01/2024", "14/01/2024",
"14/01/2024", "14/01/2024", "14/01/2024", "15/01/2024", "15/01/2024",
"15/01/2024", "15/01/2024", "16/01/2024", "16/01/2024", "16/01/2024",
"16/01/2024", "17/01/2024", "17/01/2024", "17/01/2024", "17/01/2024",
"18/01/2024", "18/01/2024", "18/01/2024", "18/01/2024", "19/01/2024",
"19/01/2024", "19/01/2024", "19/01/2024", "20/01/2024", "20/01/2024",
"20/01/2024", "20/01/2024", "21/01/2024", "21/01/2024", "21/01/2024",
"21/01/2024", "22/01/2024", "22/01/2024", "22/01/2024", "22/01/2024",
"23/01/2024", "23/01/2024", "23/01/2024", "23/01/2024", "24/01/2024",
"24/01/2024", "24/01/2024", "24/01/2024", "25/01/2024", "25/01/2024",
"25/01/2024", "25/01/2024", "26/01/2024", "26/01/2024", "26/01/2024",
"26/01/2024", "27/01/2024", "27/01/2024", "27/01/2024", "27/01/2024",
"28/01/2024", "28/01/2024", "28/01/2024", "28/01/2024", "29/01/2024",
"29/01/2024", "29/01/2024", "29/01/2024", "30/01/2024", "30/01/2024",
"30/01/2024", "30/01/2024"), Condition = c("E1A", "E1A", "E1B",
"E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B",
"E1A", "E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B", "E1A",
"E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A",
"E1B", "E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A", "E1B",
"E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B",
"E1A", "E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B", "E1A",
"E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A",
"E1B", "E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A", "E1B",
"E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B",
"E1A", "E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B", "E1A",
"E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A",
"E1B", "E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A", "E1B",
"E1B", "E1A", "E1A", "E1B", "E1B", "E1A", "E1A", "E1B", "E1B"
), Replicate = c(1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L,
2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L,
2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L,
2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L,
2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L,
2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L,
2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L,
2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L), Events = c(7L,
5L, 5L, 4L, 8L, 7L, 7L, 7L, 7L, 4L, 6L, 10L, 3L, 4L, 9L, 3L,
2L, 3L, 11L, 2L, 5L, 4L, 6L, 8L, 6L, 6L, 7L, 4L, 6L, 1L, 6L,
9L, 3L, 2L, 9L, 10L, 4L, 6L, 6L, 3L, 5L, 3L, 7L, 2L, 8L, 3L,
8L, 8L, 10L, 6L, 8L, 5L, 4L, 5L, 12L, 9L, 4L, 2L, 9L, 5L, 6L,
1L, 8L, 6L, 5L, 8L, 9L, 5L, 6L, 4L, 6L, 7L, 6L, 3L, 3L, 4L, 6L,
4L, 5L, 5L, 3L, 7L, 2L, 4L, 2L, 3L, 7L, 8L, 4L, 5L, 8L, 6L, 3L,
6L, 8L, 5L, 4L, 7L, 9L, 5L, 3L, 7L, 15L, 5L, 7L, 6L, 5L, 12L,
5L, 12L, 5L, 3L, 7L, 4L, 6L, 6L, 4L, 6L, 3L, 8L)), class = "data.frame", row.names = c(NA,
-120L))

ui <- fluidPage(
  titlePanel(h2("Jobs Application Dashboard", align = "center")),
  fluidRow(
    column(
      3,
      hr(style="border-color: black"),
      h6("Overall", align = "center"),
      hr(style="border-color: black"),
      align = "center"
    ),
    column(
      9,
      hr(style="border-color: black"),
      h6("Condition A", align = "center"),
      hr(style="border-color: black"),
      align = "center"
    )
  ),
  fluidRow(
    column(
      3,
      h5("Applications Sent", align = "center"),
      h3(textOutput("applications_sent"), align = "center"),
      align = "center"
    ),
    column(
      3,
      h5("Events per Application", align = "center"),
      h3(textOutput("events_per_applicationA"), align = "center"),
      align = "center"
    ),
    column(
      3,
      h5("Applications per Contact", align = "center"),
      h3(textOutput("events_per_interviewA"), align = "center"),
      align = "center"
    ),
    column(
      3,
      h5("Applications per Interview", align = "center"),
      h3(textOutput("applications_per_interviewA"), align = "center"),
      align = "center"
    )
  ),
  fluidRow(
    column(
      3,
      align = "center"
    ),
    column(
      9,
      hr(style="border-color: black"),
      h6("Condition B", align = "center"),
      hr(style="border-color: black"),
      align = "center"
    )
  ),
  fluidRow(
    column(
      3,
      h5("Total Days", align = "center"),
      h3(textOutput("total_days"), align = "center"),
      align = "center"
    ),
    column(
      3,
      h5("Events per Application", align = "center"),
      h3(textOutput("events_per_applicationB"), align = "center"),
      align = "center"
    ),
    column(
      3,
      h5("Applications per Contact", align = "center"),
      h3(textOutput("events_per_interviewB"), align = "center"),
      align = "center"
    ),
    column(
      3,
      h5("Applications per Interview", align = "center"),
      h3(textOutput("applications_per_interviewB"), align = "center"),
      align = "center"
    )
  ),
  fluidRow(
    column(
      3,
      plotOutput("poisson_regression"),
      align = "center"
    ),
    column(
      3,
      plotOutput("logistic_regression2"),
      align = "center"
    ),
    column(
      3,
      plotOutput("km_curve"),
      align = "center"
    ),
    column(
      3,
      plotOutput("logistic_regression"),
      align = "center"
    )
  ),
  fluidRow(
    column(
      3,
      h5(textOutput("count_effect"), align = "center"),
      align = "center"
    ),
    column(
      3,
      h5(textOutput("odds_effect2"), align = "center"),
      align = "center"
    ),
    column(
      3,
      h5(textOutput("curve_difference"), align = "center"),
      align = "center"
    ),
    column(
      3,
      h5(textOutput("odds_effect"), align = "center"),
      align = "center"
    )
  ),
  fluidRow(
    column(
      4,
      align = "center"
    ),
    column(
      4,
      actionButton("upload_button", label = "Upload"),
      align = "center"
    ),
    column(
      4,
      align = "center"
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  experiment_data <- reactiveVal(experiment_data)

  event_data <- reactiveVal(event_data)

  conditionA <- reactiveVal("E1A")

  conditionB <- reactiveVal("E1B")

  observeEvent(input$upload_button, {
    showModal(modalDialog(
      title = "File Upload",
      div(fileInput("experiment_upload", label = "Upload Experiment Data"), align = "center"),
      div(fileInput("event_upload", label = "Upload Event Data"), align = "center"),
      div(textInput("condition_a", label = "Condition A"), align = "center"),
      div(textInput("condition_b", label = "Condition B"), align = "center"),
      footer = tagList(
        actionButton("upload_confirm", label = "Confirm Upload"),
        modalButton("Cancel")
      )
    ))
  })

  observeEvent(input$upload_confirm, {
    experiment_data(read.csv(input$experiment_upload$datapath))
    event_data(read.csv(input$event_upload$datapath))
    conditionA(input$condition_a)
    conditionB(input$condition_b)
    removeModal()
  })

#  modeling_data <- reactive({merge(
#    experiment_data(),
#    event_data(),
#    by.x = c("Application.Date", "Condition", "Replicate"),
#    by.y = c("Date", "Condition", "Replicate")
#  )})

  poisson_model <- reactive({glm(
    Events ~ Condition + Date + Replicate,
    family = poisson(),
    data = event_data()
  )})

  poisson_summary <- reactive({as.data.frame(summary(poisson_model())$coefficients)})

  logistic_model <- reactive({glm(
    Interview ~ Condition + Replicate,
    family = "binomial",
    data = experiment_data()
  )})

  logistic_summary <- reactive({summary(logistic_model())$coefficients})

  logistic_model2 <- reactive({glm(
    Response ~ Condition + Replicate,
    family = "binomial",
    data = experiment_data()
  )})

  logistic_summary2 <- reactive({summary(logistic_model2())$coefficients})

  km_model <- reactive({survfit(
    Surv(
      time = as.Date(experiment_data()$Response.Date, format = "%d/%m/%Y") -
             as.Date(experiment_data()$Application.Date, format = "%d/%m/%Y"),
      event = experiment_data()$Response
    ) ~ experiment_data()$Condition
  )})

  km_diff <- reactive({survdiff(
    Surv(
      time = as.Date(experiment_data()$Response.Date, format = "%d/%m/%Y") -
             as.Date(experiment_data()$Application.Date, format = "%d/%m/%Y"),
      event = experiment_data()$Response
    ) ~ experiment_data()$Condition
  )})

  output$applications_sent <- renderText({
    length(experiment_data()$Job)
  })

  output$total_days <- renderText({
    length(unique(experiment_data()$Application.Date))
  })

  output$events_per_applicationA <- renderText({
    sum(event_data()[event_data()$Condition == conditionA(),]$Events) /
      length(experiment_data()[experiment_data()$Condition == conditionA(),]$Job)
  })

  output$events_per_interviewA <- renderText({
    length(experiment_data()[experiment_data()$Condition == conditionA(),]$Job) /
      sum(experiment_data()[experiment_data()$Condition == conditionA(),]$Response)
  })

  output$applications_per_interviewA <- renderText({
    length(experiment_data()[experiment_data()$Condition == conditionA(),]$Job) /
      sum(experiment_data()[experiment_data()$Condition == conditionA(),]$Interview)
  })

  output$events_per_applicationB <- renderText({
    sum(event_data()[event_data()$Condition == conditionB(),]$Events) /
      length(experiment_data()[experiment_data()$Condition == conditionB(),]$Job)
  })

  output$events_per_interviewB <- renderText({
    length(experiment_data()[experiment_data()$Condition == conditionB(),]$Job) /
      sum(experiment_data()[experiment_data()$Condition == conditionB(),]$Response)
  })

  output$applications_per_interviewB <- renderText({
    length(experiment_data()[experiment_data()$Condition == conditionB(),]$Job) /
      sum(experiment_data()[experiment_data()$Condition == conditionB(),]$Interview)
  })

  output$poisson_regression <- renderPlot({
    boxplot(
      poisson_model()$fitted.values ~ poisson_model()$data$Condition,
      main = "Fitted Events Counts",
      ylab = NULL,
      xlab = NULL
    )
  })

  output$logistic_regression <- renderPlot({
    boxplot(
      logistic_model()$fitted.values ~ logistic_model()$data$Condition,
      main = "Fitted Interview Probabilities",
      ylab = NULL,
      xlab = NULL
    )
  })

  output$logistic_regression2 <- renderPlot({
    boxplot(
      logistic_model2()$fitted.values ~ logistic_model2()$data$Condition,
      main = "Fitted Contact Probabilities",
      ylab = NULL,
      xlab = NULL
    )
  })

  output$km_curve <- renderPlot({
    plot(
      km_model(), col = c("black","blue"),
      main = "Contact Curves", fun = "event")
  })

  output$count_effect <- renderText({
    paste(
      "Count Effect:", round(poisson_summary()[[paste0("Condition", conditionB()), "Estimate"]], 2),
      "+/-", round(poisson_summary()[[paste0("Condition", conditionB()), "Std. Error"]], 2),
      "(", poisson_summary()[[paste0("Condition", conditionB()), "Pr(>|z|)"]], ")"
    )
  })

  output$odds_effect <- renderText({
    paste(
      "Odds Ratio Effect:", round(exp(logistic_summary()[[paste0("Condition", conditionB()), "Estimate"]]), 2),
      "+/-", round(exp(logistic_summary()[[paste0("Condition", conditionB()), "Std. Error"]]), 2),
      "(", logistic_summary()[[paste0("Condition", conditionB()), "Pr(>|z|)"]], ")"
    )
  })

  output$odds_effect2 <- renderText({
    paste(
      "Odds Ratio Effect:", round(exp(logistic_summary2()[[paste0("Condition", conditionB()), "Estimate"]]), 2),
      "+/-", round(exp(logistic_summary2()[[paste0("Condition", conditionB()), "Std. Error"]]), 2),
      "(", logistic_summary2()[[paste0("Condition", conditionB()), "Pr(>|z|)"]], ")"
    )
  })

  output$curve_difference <- renderText({
    paste("Curve Difference:", "(", km_diff()$pvalue, ")")
  })
}

# Run the application
shinyApp(ui = ui, server = server)
