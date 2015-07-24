class CompanySerializer < ActiveModel::Serializer
	attributes :name, :address

	has_many :positions
end
