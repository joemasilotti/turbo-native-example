class ConfigurationsController < ApplicationController
  def show
    render json: {
      settings: {},
      rules: [
        {
          patterns: [
            "^/articles/[0-9]+$"
          ],
          properties: {
            controller: "article"
          }
        }
      ]
    }
  end
end
