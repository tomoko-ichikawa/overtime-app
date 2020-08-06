##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Serverless < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class AssetList < ListResource
            ##
            # Initialize the AssetList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The SID of the Service that the Asset resource is
            #   associated with.
            # @return [AssetList] AssetList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid}
              @uri = "/Services/#{@solution[:service_sid]}/Assets"
            end

            ##
            # Lists AssetInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(limit: limit, page_size: page_size).entries
            end

            ##
            # Streams AssetInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields AssetInstance records from the API.
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
            # Retrieve a single page of AssetInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of AssetInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params: params)

              AssetPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of AssetInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of AssetInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              AssetPage.new(@version, response, @solution)
            end

            ##
            # Create the AssetInstance
            # @param [String] friendly_name A descriptive string that you create to describe
            #   the Asset resource. It can be up to 255 characters long.
            # @return [AssetInstance] Created AssetInstance
            def create(friendly_name: nil)
              data = Twilio::Values.of({'FriendlyName' => friendly_name, })

              payload = @version.create('POST', @uri, data: data)

              AssetInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Serverless.V1.AssetList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class AssetPage < Page
            ##
            # Initialize the AssetPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [AssetPage] AssetPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of AssetInstance
            # @param [Hash] payload Payload response from the API
            # @return [AssetInstance] AssetInstance
            def get_instance(payload)
              AssetInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Serverless.V1.AssetPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class AssetContext < InstanceContext
            ##
            # Initialize the AssetContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The SID of the Service to fetch the Asset resource
            #   from.
            # @param [String] sid The SID of the Asset resource to fetch.
            # @return [AssetContext] AssetContext
            def initialize(version, service_sid, sid)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid, sid: sid, }
              @uri = "/Services/#{@solution[:service_sid]}/Assets/#{@solution[:sid]}"

              # Dependents
              @asset_versions = nil
            end

            ##
            # Fetch the AssetInstance
            # @return [AssetInstance] Fetched AssetInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              AssetInstance.new(@version, payload, service_sid: @solution[:service_sid], sid: @solution[:sid], )
            end

            ##
            # Delete the AssetInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
               @version.delete('DELETE', @uri)
            end

            ##
            # Update the AssetInstance
            # @param [String] friendly_name A descriptive string that you create to describe
            #   the Asset resource. It can be up to 255 characters long.
            # @return [AssetInstance] Updated AssetInstance
            def update(friendly_name: nil)
              data = Twilio::Values.of({'FriendlyName' => friendly_name, })

              payload = @version.update('POST', @uri, data: data)

              AssetInstance.new(@version, payload, service_sid: @solution[:service_sid], sid: @solution[:sid], )
            end

            ##
            # Access the asset_versions
            # @return [AssetVersionList]
            # @return [AssetVersionContext] if sid was passed.
            def asset_versions(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return AssetVersionContext.new(@version, @solution[:service_sid], @solution[:sid], sid, )
              end

              unless @asset_versions
                @asset_versions = AssetVersionList.new(
                    @version,
                    service_sid: @solution[:service_sid],
                    asset_sid: @solution[:sid],
                )
              end

              @asset_versions
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Serverless.V1.AssetContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Serverless.V1.AssetContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class AssetInstance < InstanceResource
            ##
            # Initialize the AssetInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The SID of the Service that the Asset resource is
            #   associated with.
            # @param [String] sid The SID of the Asset resource to fetch.
            # @return [AssetInstance] AssetInstance
            def initialize(version, payload, service_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'friendly_name' => payload['friendly_name'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {'service_sid' => service_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [AssetContext] AssetContext for this AssetInstance
            def context
              unless @instance_context
                @instance_context = AssetContext.new(@version, @params['service_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The unique string that identifies the Asset resource
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The SID of the Account that created the Asset resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The SID of the Service that the Asset resource is associated with
            def service_sid
              @properties['service_sid']
            end

            ##
            # @return [String] The string that you assigned to describe the Asset resource
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [Time] The ISO 8601 date and time in GMT when the Asset resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The ISO 8601 date and time in GMT when the Asset resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The absolute URL of the Asset resource
            def url
              @properties['url']
            end

            ##
            # @return [String] The links to the nested resources of the asset
            def links
              @properties['links']
            end

            ##
            # Fetch the AssetInstance
            # @return [AssetInstance] Fetched AssetInstance
            def fetch
              context.fetch
            end

            ##
            # Delete the AssetInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Update the AssetInstance
            # @param [String] friendly_name A descriptive string that you create to describe
            #   the Asset resource. It can be up to 255 characters long.
            # @return [AssetInstance] Updated AssetInstance
            def update(friendly_name: nil)
              context.update(friendly_name: friendly_name, )
            end

            ##
            # Access the asset_versions
            # @return [asset_versions] asset_versions
            def asset_versions
              context.asset_versions
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Serverless.V1.AssetInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Serverless.V1.AssetInstance #{values}>"
            end
          end
        end
      end
    end
  end
end