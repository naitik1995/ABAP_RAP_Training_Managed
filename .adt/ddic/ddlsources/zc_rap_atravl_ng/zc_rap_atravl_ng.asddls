@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection View for Travel BO'
@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity ZC_RAP_ATRAVL_NG as projection on ZI_RAP_ATRAVL_NG as Travel
{
  key TravelUUID,
      @Search.defaultSearchElement: true
      TravelID,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency', element: 'AgencyID'} }]
      @ObjectModel.text.element: ['AgencyName']
      @Search.defaultSearchElement: true
      AgencyID,
      _Agency.Name       as AgencyName,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID'} }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      CustomerID,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency'} }]
      CurrencyCode,
      Description,
      TravelStatus,
      LastChangedAt,
      LocalLastChangedAt,

      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZC_RAP_BOOKING_NG,
      _Currency,
      _Customer 
}
