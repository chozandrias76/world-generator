class GenerateController < ApplicationController
  def index
    respond_to do |format|

      format.html # show.html.erb
      format.json { render json: {data: {
        map: "data:image/png;base64,APf/APL2+5iszMvU3Ozx+cqqNvaVTMzV4Zy"
      }} }
    
     end
  end
end