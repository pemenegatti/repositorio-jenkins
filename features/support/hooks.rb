# frozen_string_literal: true

Before do
  @site = AcessarSite.new
end

After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')

  if scenario.failed?
    Utils.tirar_foto(scenario_name.downcase!, 'falhou')
  else
    Utils.tirar_foto(scenario_name.downcase!, 'passou')
  end

  at_exit do
    ReportBuilder.configure do |config|
      config.input_path = 'results/cucumber_json'
      config.report_path = 'results/report'
    end
    ReportBuilder.build_report
  end
end
