class VivaioEventsController < ApplicationController
  before_action :set_vivaio_event, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, except: [:index, :show]

  def index
    @vivaio_events = VivaioEvent.by_event_date
  end

  def new
    @vivaio_event = VivaioEvent.new
  end

  def create
    @vivaio_event = VivaioEvent.new(vivaio_event_params)
    if @vivaio_event.save
      redirect_to vivaio_event_path(@vivaio_event)
    else
      render :new
    end
  end

  def show
    @vivaio_event = VivaioEvent.find(params[:id])
  end

  def edit
  end

  def update
    @vivaio_event.update(vivaio_event_params)
    redirect_to vivaio_event_path(@vivaio_event)
  end

  def destroy
    @vivaio_event.destroy
    redirect_to vivaio_events_path
  end

  private

  def set_vivaio_event
    @vivaio_event = VivaioEvent.find(params[:id])
  end

  def vivaio_event_params
    params.require(:vivaio_event).permit(:title, :content, :data_evento)
  end
end
