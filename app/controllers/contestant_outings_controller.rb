class ContestantOutingsController < ApplicationController
  def destroy
    outing = Outing.find(params[:outing_id])
    contestant_outing = ContestantOuting.find_by(outing: outing, contestant_id: params[:id])

    if contestant_outing
      contestant_outing.destroy
    end
    
    redirect_to outing_path(outing.id)
  end
end