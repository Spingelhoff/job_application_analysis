library(shiny)

default_data <- data.frame(
  date = as.character(format(as.Date(Sys.Date()), "%d/%m/%Y")),
  condition = c("E1A", "E1B"),
  replicate = 1L,
  job = 1:2,
  company = 3:4
)

ui <- fluidPage(
  titlePanel(h2("Jobs Application Randomizer", align = "center")),
  fluidRow(
    column(
      3,
      dateInput("date_input","Date", Sys.Date()),
      align = "center"
    ),
    column(
      3,
      numericInput("replicate_input", "Replicate", 1),
      align = "center"
    ),
    column(
      3,
      textInput("id_input", "Identification Prefix", "E"),
      align = "center"
    ),
    column(
      3,
      numericInput("serial_input", "Serial Number", 1),
      align = "center"
    )
  ),
  fluidRow(
    column(
      4,
      h4("Job", align = "center"),
      textInput("job_a_input", NULL),
      textInput("job_b_input", NULL),
      align = "center"
    ),
    column(
      4,
      h4("Company", align = "center"),
      textInput("company_a_input", NULL),
      textInput("company_b_input", NULL),
      align = "center"
    ),
    column(
      4,
      h4("Link", align = "center"),
      textInput("link_a_input", NULL),
      textInput("link_b_input", NULL),
      align = "center"
    )
  ),
  fluidRow(
    column(
      6,
      actionButton("copy_button", "Copy"),
      align = "right"
    ),
    column(
      6,
      actionButton("randomize_button", "Randomize"),
      align = "left"
    )
  ),
  fluidRow(
    tableOutput("table"),
    align = "center"
  )
)

server <- function(input, output) {
  table_data <- reactiveVal({default_data})

  observeEvent(input$copy_button,{
    table_data(
      data.frame(
        date = as.character(format(input$date_input, "%d/%m/%Y")),
        condition = c(paste0(input$id_input, input$serial_input, "A"), paste0(input$id_input, input$serial_input, "B")),
        replicate = input$replicate_input,
        job = c(input$job_a_input, input$job_b_input),
        company = c(input$company_a_input, input$company_b_input)
      )
    )
  })

  observeEvent(input$randomize_button,{
    table_data(
      data.frame(
        date = as.character(format(input$date_input, "%d/%m/%Y")),
        condition = sample(c(paste0(input$id_input, input$serial_input, "A"), paste0(input$id_input, input$serial_input, "B")), 2),
        replicate = input$replicate_input,
        job = c(input$job_a_input, input$job_b_input),
        company = c(input$company_a_input, input$company_b_input)
      )
    )
    showModal(modalDialog(
      title = "Randomization Status",
      "Success!",
      footer = modalButton("Close")
    ))
  })

  output$table <- renderTable({table_data()})
}

# Run the application
shinyApp(ui = ui, server = server)
