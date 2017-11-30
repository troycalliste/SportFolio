class TopcompsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "topcomps_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def check
  end
end
