class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  include EventsHelper

  def create_google_cal(event)
    @calendar = GoogleCalWrapper.new(current_user, event)
  end

  # GET /events
  # GET /events.json
  def index
    @events = Event.where("date > ?", Date.today).order(:date).paginate(page: params[:page], per_page: 20)
  end

  def past_events
    @events = Event.where("date < ?", Date.today).order(:date).paginate(page: params[:page], per_page: 20)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @note = Note.new
    @note.event_id = @event.id
    @notes = Note.order('created_at DESC').where(event_id: @event.id)
    @payments = Payment.order('created_at DESC').where(event_id: @event.id)
    @total_payments = Payment.order('created_at DESC').where(event_id: @event.id).sum(:amount)
    @total_debt = @event.total - @total_payments if @event.total
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    total = @event.per_pax * @event.pax if @event.per_pax && @event.pax
    @event.total = total if total
    create_google_cal(@event) unless @event.location == "Otro" || current_user.cal == false
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
      total = params[:event][:per_pax].to_i * @event.pax if params[:event][:per_pax] && @event.pax
      params[:event][:total] = total if total
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :phone, :email, :event_type, :date, :location, :pax, :contact, :attended_by, :start_time, :end_time, :description, :total, :per_pax)
    end
end
