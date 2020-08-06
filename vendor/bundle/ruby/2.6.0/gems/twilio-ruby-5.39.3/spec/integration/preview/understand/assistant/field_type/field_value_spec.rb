##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'FieldValue' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .field_types('UBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .field_values('UCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/understand/Assistants/UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/FieldTypes/UBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/FieldValues/UCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/FieldTypes/UBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/FieldValues/UCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "field_type_sid": "UBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "language": "language",
          "assistant_sid": "UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "value": "value",
          "date_updated": "2015-07-30T20:00:00Z",
          "date_created": "2015-07-30T20:00:00Z",
          "sid": "UCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "synonym_of": null
      }
      ]
    ))

    actual = @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                       .field_types('UBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                       .field_values('UCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .field_types('UBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .field_values.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/understand/Assistants/UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/FieldTypes/UBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/FieldValues',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "field_values": [],
          "meta": {
              "first_page_url": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/FieldTypes/UBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/FieldValues?Language=language&PageSize=50&Page=0",
              "page_size": 50,
              "previous_page_url": null,
              "key": "field_values",
              "page": 0,
              "next_page_url": null,
              "url": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/FieldTypes/UBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/FieldValues?Language=language&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                       .field_types('UBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                       .field_values.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "field_values": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "url": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/FieldTypes/UBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/FieldValues/UCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "field_type_sid": "UBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "language": "language",
                  "assistant_sid": "UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "value": "value",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "date_created": "2015-07-30T20:00:00Z",
                  "sid": "UCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "synonym_of": "UCbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
              }
          ],
          "meta": {
              "first_page_url": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/FieldTypes/UBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/FieldValues?Language=language&PageSize=50&Page=0",
              "page_size": 50,
              "previous_page_url": null,
              "key": "field_values",
              "page": 0,
              "next_page_url": null,
              "url": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/FieldTypes/UBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/FieldValues?Language=language&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                       .field_types('UBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                       .field_values.list()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .field_types('UBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .field_values.create(language: 'language', value: 'value')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'Language' => 'language', 'Value' => 'value', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://preview.twilio.com/understand/Assistants/UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/FieldTypes/UBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/FieldValues',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/FieldTypes/UBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/FieldValues/UCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "field_type_sid": "UBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "language": "language",
          "assistant_sid": "UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "value": "value",
          "date_updated": "2015-07-30T20:00:00Z",
          "date_created": "2015-07-30T20:00:00Z",
          "sid": "UCaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "synonym_of": "UCbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
      }
      ]
    ))

    actual = @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                       .field_types('UBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                       .field_values.create(language: 'language', value: 'value')

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .field_types('UBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .field_values('UCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://preview.twilio.com/understand/Assistants/UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/FieldTypes/UBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/FieldValues/UCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                       .field_types('UBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                       .field_values('UCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end