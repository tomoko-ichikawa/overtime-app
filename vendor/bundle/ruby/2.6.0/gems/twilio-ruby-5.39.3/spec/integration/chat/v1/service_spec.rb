##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Service' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.chat.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://chat.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "consumption_report_interval": 100,
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "default_channel_creator_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "default_channel_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "default_service_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "friendly_name",
          "limits": {
              "actions_per_second": 20,
              "channel_members": 100,
              "user_channels": 250
          },
          "links": {},
          "notifications": {},
          "post_webhook_url": "post_webhook_url",
          "pre_webhook_url": "pre_webhook_url",
          "reachability_enabled": false,
          "read_status_enabled": false,
          "sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "typing_indicator_timeout": 100,
          "url": "http://www.example.com",
          "webhook_filters": [
              "webhook_filters"
          ],
          "webhook_method": "webhook_method",
          "webhooks": {}
      }
      ]
    ))

    actual = @client.chat.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.chat.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://chat.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.chat.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.chat.v1.services.create(friendly_name: 'friendly_name')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'FriendlyName' => 'friendly_name', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://chat.twilio.com/v1/Services',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "consumption_report_interval": 100,
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "default_channel_creator_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "default_channel_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "default_service_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "friendly_name",
          "limits": {
              "actions_per_second": 20,
              "channel_members": 100,
              "user_channels": 250
          },
          "links": {},
          "notifications": {},
          "post_webhook_url": "post_webhook_url",
          "pre_webhook_url": "pre_webhook_url",
          "reachability_enabled": false,
          "read_status_enabled": false,
          "sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "typing_indicator_timeout": 100,
          "url": "http://www.example.com",
          "webhook_filters": [
              "webhook_filters"
          ],
          "webhook_method": "webhook_method",
          "webhooks": {}
      }
      ]
    ))

    actual = @client.chat.v1.services.create(friendly_name: 'friendly_name')

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.chat.v1.services.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://chat.twilio.com/v1/Services',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://chat.twilio.com/v1/Services?Page=0&PageSize=50",
              "key": "services",
              "next_page_url": null,
              "page": 0,
              "page_size": 0,
              "previous_page_url": null,
              "url": "https://chat.twilio.com/v1/Services"
          },
          "services": []
      }
      ]
    ))

    actual = @client.chat.v1.services.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://chat.twilio.com/v1/Services?Page=0&PageSize=50",
              "key": "services",
              "next_page_url": null,
              "page": 0,
              "page_size": 1,
              "previous_page_url": null,
              "url": "https://chat.twilio.com/v1/Services"
          },
          "services": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "consumption_report_interval": 100,
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "default_channel_creator_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "default_channel_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "default_service_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "friendly_name": "friendly_name",
                  "limits": {
                      "actions_per_second": 20,
                      "channel_members": 100,
                      "user_channels": 250
                  },
                  "links": {},
                  "notifications": {},
                  "post_webhook_url": "post_webhook_url",
                  "pre_webhook_url": "pre_webhook_url",
                  "reachability_enabled": false,
                  "read_status_enabled": false,
                  "sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "typing_indicator_timeout": 100,
                  "url": "http://www.example.com",
                  "webhook_filters": [
                      "webhook_filters"
                  ],
                  "webhook_method": "webhook_method",
                  "webhooks": {}
              }
          ]
      }
      ]
    ))

    actual = @client.chat.v1.services.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.chat.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://chat.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "consumption_report_interval": 100,
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "default_channel_creator_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "default_channel_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "default_service_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "friendly_name",
          "limits": {
              "actions_per_second": 20,
              "channel_members": 500,
              "user_channels": 600
          },
          "links": {},
          "notifications": {},
          "post_webhook_url": "post_webhook_url",
          "pre_webhook_url": "pre_webhook_url",
          "reachability_enabled": false,
          "read_status_enabled": false,
          "sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "typing_indicator_timeout": 100,
          "url": "http://www.example.com",
          "webhook_filters": [
              "webhook_filters"
          ],
          "webhook_method": "webhook_method",
          "webhooks": {}
      }
      ]
    ))

    actual = @client.chat.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end
end