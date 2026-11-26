# Carga la biblioteca de shiny
library(shiny)
# Crea un vector llamado ventas con estos días e importes: lunes 100, martes 150, miércoles 120, jueves 180 y viernes 220.
ventas <- c(100, 150, 120, 180, 220)
dias <- c("Lunes", "Martes", "Miércoles", "Jueves", "Viernes")
# Calcula el porcentaje de ventas de cada día y guarda el resultado en porcentajes.
porcentajes <- round(ventas / sum(ventas) * 100, 2)
# Crea un vector llamado etiquetas con los días de lunes a viernes y sus porcentajes con un decimal y el signo %.
etiquetas <- paste(dias, porcentajes, "%", sep = ": ")
# Crea un vector llamado colores con "skyblue", "plum", "lightgreen", "pink" y "gold", en ese orden.
colores <- c("skyblue", "plum", "lightgreen", "pink", "gold")
# Crea la pantalla de Shiny llamada ui con fluidPage() y coloca dentro plotOutput("grafica_circular").

ui <- fluidPage(
  plotOutput("grafica_circular")
)
# Crea el server de Shiny y usa renderPlot() para mostrar output$grafica_circular.
# Dibuja las ventas con pie(), usa etiquetas y colores, y pon el título "Ventas de la papelería".
server <- function(input, output) {
  output$grafica_circular <- renderPlot({
    pie(ventas, labels = etiquetas, col = colores, main = "Ventas de la papelería")
  })
}
# Inicia la aplicación Shiny usando ui y server
shinyApp(ui = ui, server = server)