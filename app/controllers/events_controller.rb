class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all
    json_response(@events)
  end

  # POST /events
  def create
    @event = Event.create!(event_params)
    json_response(@event, :created)
  end

  # GET /events/:id
  def show
    json_response(hash_format_of_event(@event))
  end

  # PUT /events/:id
  def update
    @event.update(event_params)
    head :no_content
  end

  # DELETE /events/:id
  def destroy
    @event.destroy
    head :no_content
  end

  private

  def hash_format_of_event(event)
    { start_time: event.start_time.iso8601(), end_time: event.end_time.iso8601(), label: event.label, category_name: event.category.label }
  end

  def event_params
    # whitelist params
    params.permit(:start_time, :end_time, :label, :category)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
