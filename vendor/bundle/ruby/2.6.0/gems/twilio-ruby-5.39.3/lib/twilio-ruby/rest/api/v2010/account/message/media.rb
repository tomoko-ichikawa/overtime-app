##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class MessageContext < InstanceContext
            class MediaList < ListResource
              ##
              # Initialize the MediaList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The SID of the
              #   [Account](https://www.twilio.com/docs/iam/api/account) that created this Media
              #   resource.
              # @param [String] message_sid The unique string that that we created to identify
              #   the Message resource.
              # @return [MediaList] MediaList
              def initialize(version, account_sid: nil, message_sid: nil)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, message_sid: message_sid}
                @uri = "/Accounts/#{@solution[:account_sid]}/Messages/#{@solution[:message_sid]}/Media.json"
              end

              ##
              # Lists MediaInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [Time] date_created_before Only include media that was created on this date
              # @param [Time] date_created Only include media that was created on this date
              # @param [Time] date_created_after Only include media that was created on this date
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(date_created_before: :unset, date_created: :unset, date_created_after: :unset, limit: nil, page_size: nil)
                self.stream(
                    date_created_before: date_created_before,
                    date_created: date_created,
                    date_created_after: date_created_after,
                    limit: limit,
                    page_size: page_size
                ).entries
              end

              ##
              # Streams MediaInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [Time] date_created_before Only include media that was created on this date
              # @param [Time] date_created Only include media that was created on this date
              # @param [Time] date_created_after Only include media that was created on this date
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(date_created_before: :unset, date_created: :unset, date_created_after: :unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(
                    date_created_before: date_created_before,
                    date_created: date_created,
                    date_created_after: date_created_after,
                    page_size: limits[:page_size],
                )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields MediaInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              def each
                limits = @version.read_limits

                page = self.page(page_size: limits[:page_size], )

                @version.stream(page,
                                limit: limits[:limit],
                                page_limit: limits[:page_limit]).each {|x| yield x}
              end

              ##
              # Retrieve a single page of MediaInstance records from the API.
              # Request is executed immediately.
              # @param [Time] date_created_before Only include media that was created on this date
              # @param [Time] date_created Only include media that was created on this date
              # @param [Time] date_created_after Only include media that was created on this date
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of MediaInstance
              def page(date_created_before: :unset, date_created: :unset, date_created_after: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'DateCreated<' => Twilio.serialize_iso8601_datetime(date_created_before),
                    'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                    'DateCreated>' => Twilio.serialize_iso8601_datetime(date_created_after),
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })

                response = @version.page('GET', @uri, params: params)

                MediaPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of MediaInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of MediaInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                MediaPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.MediaList>'
              end
            end

            class MediaPage < Page
              ##
              # Initialize the MediaPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [MediaPage] MediaPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of MediaInstance
              # @param [Hash] payload Payload response from the API
              # @return [MediaInstance] MediaInstance
              def get_instance(payload)
                MediaInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    message_sid: @solution[:message_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.MediaPage>'
              end
            end

            class MediaContext < InstanceContext
              ##
              # Initialize the MediaContext
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The SID of the
              #   [Account](https://www.twilio.com/docs/iam/api/account) that created the Media
              #   resource(s) to fetch.
              # @param [String] message_sid The SID of the Message resource that this Media
              #   resource belongs to.
              # @param [String] sid The Twilio-provided string that uniquely identifies the
              #   Media resource to fetch
              # @return [MediaContext] MediaContext
              def initialize(version, account_sid, message_sid, sid)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, message_sid: message_sid, sid: sid, }
                @uri = "/Accounts/#{@solution[:account_sid]}/Messages/#{@solution[:message_sid]}/Media/#{@solution[:sid]}.json"
              end

              ##
              # Delete the MediaInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                 @version.delete('DELETE', @uri)
              end

              ##
              # Fetch the MediaInstance
              # @return [MediaInstance] Fetched MediaInstance
              def fetch
                payload = @version.fetch('GET', @uri)

                MediaInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    message_sid: @solution[:message_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.MediaContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.MediaContext #{context}>"
              end
            end

            class MediaInstance < InstanceResource
              ##
              # Initialize the MediaInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The SID of the
              #   [Account](https://www.twilio.com/docs/iam/api/account) that created this Media
              #   resource.
              # @param [String] message_sid The unique string that that we created to identify
              #   the Message resource.
              # @param [String] sid The Twilio-provided string that uniquely identifies the
              #   Media resource to fetch
              # @return [MediaInstance] MediaInstance
              def initialize(version, payload, account_sid: nil, message_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'content_type' => payload['content_type'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'parent_sid' => payload['parent_sid'],
                    'sid' => payload['sid'],
                    'uri' => payload['uri'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'account_sid' => account_sid,
                    'message_sid' => message_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [MediaContext] MediaContext for this MediaInstance
              def context
                unless @instance_context
                  @instance_context = MediaContext.new(
                      @version,
                      @params['account_sid'],
                      @params['message_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The SID of the Account that created this resource
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The default mime-type of the media
              def content_type
                @properties['content_type']
              end

              ##
              # @return [Time] The RFC 2822 date and time in GMT that this resource was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The RFC 2822 date and time in GMT that this resource was last updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [String] The SID of the resource that created the media
              def parent_sid
                @properties['parent_sid']
              end

              ##
              # @return [String] The unique string that identifies this resource
              def sid
                @properties['sid']
              end

              ##
              # @return [String] The URI of this resource, relative to `https://api.twilio.com`
              def uri
                @properties['uri']
              end

              ##
              # Delete the MediaInstance
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete
                context.delete
              end

              ##
              # Fetch the MediaInstance
              # @return [MediaInstance] Fetched MediaInstance
              def fetch
                context.fetch
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.MediaInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.MediaInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end