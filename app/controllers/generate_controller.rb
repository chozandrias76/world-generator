class GenerateController < ApplicationController
  def index
    respond_to do |format|

      format.html # show.html.erb
      format.json {
        render(
          json: 
            JSON.generate(
              {
                :data => 
                "data:image/png;base64,#{Base64.strict_encode64(
                    GenerateMapService.new(
                      width: nil, height: nil, perlin_scale: nil, water_level: nil
                    ).generate.to_blob
                  )}"
              }
            ),
          status: :ok
        )
       }
     end
  end
end