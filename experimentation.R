library(ggdag)

traffic_causal_model <- dagify(
  website_traffic ~ industry_appeal + industry_openness,
  industry_appeal ~ industry_openness,
  labels = c(
    website_traffic = "website traffic",
    industry_appeal = "industry appeal"
  )
)

ggdag(
  traffic_causal_model,
) +
  theme_dag()
