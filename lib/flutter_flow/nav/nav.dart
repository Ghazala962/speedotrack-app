import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/auth/custom_auth/custom_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  SpeedotrackGPSProAuthUser? initialUser;
  SpeedotrackGPSProAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(SpeedotrackGPSProAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : VsenSplashScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? NavBarPage()
              : VsenSplashScreenWidget(),
        ),
        FFRoute(
          name: ServiceModalWidget.routeName,
          path: ServiceModalWidget.routePath,
          builder: (context, params) => ServiceModalWidget(),
        ),
        FFRoute(
          name: AddExpWidget.routeName,
          path: AddExpWidget.routePath,
          builder: (context, params) => AddExpWidget(),
        ),
        FFRoute(
          name: EditWidgetWidget.routeName,
          path: EditWidgetWidget.routePath,
          builder: (context, params) => EditWidgetWidget(),
        ),
        FFRoute(
          name: MyProfileWidget.routeName,
          path: MyProfileWidget.routePath,
          builder: (context, params) => MyProfileWidget(),
        ),
        FFRoute(
          name: MaintenancePageWidget.routeName,
          path: MaintenancePageWidget.routePath,
          builder: (context, params) => MaintenancePageWidget(),
        ),
        FFRoute(
          name: ExpensesPageWidget.routeName,
          path: ExpensesPageWidget.routePath,
          builder: (context, params) => ExpensesPageWidget(),
        ),
        FFRoute(
          name: LiveSupportWidget.routeName,
          path: LiveSupportWidget.routePath,
          builder: (context, params) => LiveSupportWidget(),
        ),
        FFRoute(
          name: KmSummaryWidget.routeName,
          path: KmSummaryWidget.routePath,
          builder: (context, params) => KmSummaryWidget(),
        ),
        FFRoute(
          name: AdvanceInfoWidget.routeName,
          path: AdvanceInfoWidget.routePath,
          builder: (context, params) => AdvanceInfoWidget(
            singleDeviceData: params.getParam(
              'singleDeviceData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: EngineLockWidget.routeName,
          path: EngineLockWidget.routePath,
          builder: (context, params) => EngineLockWidget(
            deviceData: params.getParam(
              'deviceData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: QuickSettingsWidget.routeName,
          path: QuickSettingsWidget.routePath,
          builder: (context, params) => QuickSettingsWidget(
            selectedDeviceImei: params.getParam(
              'selectedDeviceImei',
              ParamType.String,
            ),
            selectedDeviceName: params.getParam(
              'selectedDeviceName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: UpdateIconModalWidget.routeName,
          path: UpdateIconModalWidget.routePath,
          builder: (context, params) => UpdateIconModalWidget(
            selectedDeviceImei: params.getParam(
              'selectedDeviceImei',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TripInfoWidget.routeName,
          path: TripInfoWidget.routePath,
          builder: (context, params) => TripInfoWidget(
            tripData: params.getParam(
              'tripData',
              ParamType.JSON,
            ),
            selectedDeviceImei: params.getParam(
              'selectedDeviceImei',
              ParamType.String,
            ),
            selectedDeviceData: params.getParam(
              'selectedDeviceData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
            name: EventListWidget.routeName,
            path: EventListWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: EventListWidget(
                    selectedDeviceImei: params.getParam(
                      'selectedDeviceImei',
                      ParamType.String,
                    ),
                  ),
                )),
        FFRoute(
          name: PlaybackLoadingWidget.routeName,
          path: PlaybackLoadingWidget.routePath,
          builder: (context, params) => PlaybackLoadingWidget(
            deviceImei: params.getParam(
              'deviceImei',
              ParamType.String,
            ),
            startDate: params.getParam(
              'startDate',
              ParamType.String,
            ),
            endDate: params.getParam(
              'endDate',
              ParamType.String,
            ),
            minStopDuration: params.getParam(
              'minStopDuration',
              ParamType.String,
            ),
            deviceData: params.getParam(
              'deviceData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: PlaybackFinalWidget.routeName,
          path: PlaybackFinalWidget.routePath,
          builder: (context, params) => PlaybackFinalWidget(
            playbackHistoryData: params.getParam(
              'playbackHistoryData',
              ParamType.JSON,
            ),
            deviceData: params.getParam(
              'deviceData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: NewTrackingScreenWidget.routeName,
          path: NewTrackingScreenWidget.routePath,
          builder: (context, params) => NewTrackingScreenWidget(
            singleDeviceData: params.getParam(
              'singleDeviceData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: EngineLockUnsupportedWidget.routeName,
          path: EngineLockUnsupportedWidget.routePath,
          builder: (context, params) => EngineLockUnsupportedWidget(
            deviceData: params.getParam(
              'deviceData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
            name: MultipleFleetWidget.routeName,
            path: MultipleFleetWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'Multiple_Fleet')
                : NavBarPage(
                    initialPage: 'Multiple_Fleet',
                    page: MultipleFleetWidget(),
                  )),
        FFRoute(
          name: AddMaintanceWidget.routeName,
          path: AddMaintanceWidget.routePath,
          builder: (context, params) => AddMaintanceWidget(),
        ),
        FFRoute(
          name: EditMaintenanceWidget.routeName,
          path: EditMaintenanceWidget.routePath,
          builder: (context, params) => EditMaintenanceWidget(),
        ),
        FFRoute(
          name: EhSummaryWidget.routeName,
          path: EhSummaryWidget.routePath,
          builder: (context, params) => EhSummaryWidget(),
        ),
        FFRoute(
          name: SensorSummaryWidget.routeName,
          path: SensorSummaryWidget.routePath,
          builder: (context, params) => SensorSummaryWidget(),
        ),
        FFRoute(
          name: CarListScreenWidget.routeName,
          path: CarListScreenWidget.routePath,
          builder: (context, params) => CarListScreenWidget(
            filterValueParam: params.getParam(
              'filterValueParam',
              ParamType.String,
            ),
            carListFilterValueParam: params.getParam(
              'carListFilterValueParam',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TripInfoFormWidget.routeName,
          path: TripInfoFormWidget.routePath,
          builder: (context, params) => TripInfoFormWidget(
            selectedDeviceData: params.getParam(
              'selectedDeviceData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: PlaybackInputWidget.routeName,
          path: PlaybackInputWidget.routePath,
          builder: (context, params) => PlaybackInputWidget(
            selectedDeviceData: params.getParam(
              'selectedDeviceData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: UserProfileWidget.routeName,
          path: UserProfileWidget.routePath,
          builder: (context, params) => UserProfileWidget(),
        ),
        FFRoute(
          name: VehicleInformationWidget.routeName,
          path: VehicleInformationWidget.routePath,
          builder: (context, params) => VehicleInformationWidget(),
        ),
        FFRoute(
          name: TripDashboardWidget.routeName,
          path: TripDashboardWidget.routePath,
          builder: (context, params) => TripDashboardWidget(),
        ),
        FFRoute(
          name: TripInfoListWidget.routeName,
          path: TripInfoListWidget.routePath,
          builder: (context, params) => TripInfoListWidget(),
        ),
        FFRoute(
          name: SealInfoListWidget.routeName,
          path: SealInfoListWidget.routePath,
          builder: (context, params) => SealInfoListWidget(),
        ),
        FFRoute(
          name: CreateSealInfoWidget.routeName,
          path: CreateSealInfoWidget.routePath,
          builder: (context, params) => CreateSealInfoWidget(),
        ),
        FFRoute(
          name: DeviceListInfoWidget.routeName,
          path: DeviceListInfoWidget.routePath,
          builder: (context, params) => DeviceListInfoWidget(),
        ),
        FFRoute(
          name: CreateDeviceListWidget.routeName,
          path: CreateDeviceListWidget.routePath,
          builder: (context, params) => CreateDeviceListWidget(),
        ),
        FFRoute(
          name: ZoneListInfoWidget.routeName,
          path: ZoneListInfoWidget.routePath,
          builder: (context, params) => ZoneListInfoWidget(),
        ),
        FFRoute(
          name: LockScreenWidget.routeName,
          path: LockScreenWidget.routePath,
          builder: (context, params) => LockScreenWidget(
            tripId: params.getParam(
              'tripId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DrawerTripWidget.routeName,
          path: DrawerTripWidget.routePath,
          builder: (context, params) => DrawerTripWidget(),
        ),
        FFRoute(
          name: NewHomeWidget.routeName,
          path: NewHomeWidget.routePath,
          builder: (context, params) => NewHomeWidget(),
        ),
        FFRoute(
          name: AlertScreenWidget.routeName,
          path: AlertScreenWidget.routePath,
          builder: (context, params) => AlertScreenWidget(),
        ),
        FFRoute(
          name: DeviceListWidget.routeName,
          path: DeviceListWidget.routePath,
          builder: (context, params) => DeviceListWidget(),
        ),
        FFRoute(
          name: DeviceDetailsListWidget.routeName,
          path: DeviceDetailsListWidget.routePath,
          builder: (context, params) => DeviceDetailsListWidget(),
        ),
        FFRoute(
          name: EditDeviceListWidget.routeName,
          path: EditDeviceListWidget.routePath,
          builder: (context, params) => EditDeviceListWidget(),
        ),
        FFRoute(
          name: SensorListWidget.routeName,
          path: SensorListWidget.routePath,
          builder: (context, params) => SensorListWidget(),
        ),
        FFRoute(
          name: CreateSensorInfoWidget.routeName,
          path: CreateSensorInfoWidget.routePath,
          builder: (context, params) => CreateSensorInfoWidget(),
        ),
        FFRoute(
          name: CallibrationWidget.routeName,
          path: CallibrationWidget.routePath,
          builder: (context, params) => CallibrationWidget(),
        ),
        FFRoute(
          name: CustomersListWidget.routeName,
          path: CustomersListWidget.routePath,
          builder: (context, params) => CustomersListWidget(),
        ),
        FFRoute(
          name: EditCustomerListWidget.routeName,
          path: EditCustomerListWidget.routePath,
          builder: (context, params) => EditCustomerListWidget(),
        ),
        FFRoute(
          name: CreateCustomerListWidget.routeName,
          path: CreateCustomerListWidget.routePath,
          builder: (context, params) => CreateCustomerListWidget(),
        ),
        FFRoute(
          name: EditUserWidget.routeName,
          path: EditUserWidget.routePath,
          builder: (context, params) => EditUserWidget(),
        ),
        FFRoute(
          name: UpdateUserScreenWidget.routeName,
          path: UpdateUserScreenWidget.routePath,
          builder: (context, params) => UpdateUserScreenWidget(),
        ),
        FFRoute(
          name: UnusedDeviceListWidget.routeName,
          path: UnusedDeviceListWidget.routePath,
          builder: (context, params) => UnusedDeviceListWidget(),
        ),
        FFRoute(
          name: EditEventListWidget.routeName,
          path: EditEventListWidget.routePath,
          builder: (context, params) => EditEventListWidget(),
        ),
        FFRoute(
          name: AddEventListWidget.routeName,
          path: AddEventListWidget.routePath,
          builder: (context, params) => AddEventListWidget(),
        ),
        FFRoute(
            name: EventsWidget.routeName,
            path: EventsWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: EventsWidget(
                    selectedDeviceImei: params.getParam(
                      'selectedDeviceImei',
                      ParamType.String,
                    ),
                  ),
                )),
        FFRoute(
          name: TripNamesListWidget.routeName,
          path: TripNamesListWidget.routePath,
          builder: (context, params) => TripNamesListWidget(),
        ),
        FFRoute(
          name: AddNewTripWidget.routeName,
          path: AddNewTripWidget.routePath,
          builder: (context, params) => AddNewTripWidget(),
        ),
        FFRoute(
          name: TripDetailsWidget.routeName,
          path: TripDetailsWidget.routePath,
          builder: (context, params) => TripDetailsWidget(),
        ),
        FFRoute(
          name: TripUserListsWidget.routeName,
          path: TripUserListsWidget.routePath,
          builder: (context, params) => TripUserListsWidget(),
        ),
        FFRoute(
          name: Carlist2Widget.routeName,
          path: Carlist2Widget.routePath,
          builder: (context, params) => Carlist2Widget(
            filterValueParam: params.getParam(
              'filterValueParam',
              ParamType.String,
            ),
            carListFilterValueParam: params.getParam(
              'carListFilterValueParam',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TripDetailsListWidget.routeName,
          path: TripDetailsListWidget.routePath,
          builder: (context, params) => TripDetailsListWidget(
            tripData: params.getParam(
              'tripData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: AddUserWidget.routeName,
          path: AddUserWidget.routePath,
          builder: (context, params) => AddUserWidget(),
        ),
        FFRoute(
          name: CreateTripInfoWidget.routeName,
          path: CreateTripInfoWidget.routePath,
          builder: (context, params) => CreateTripInfoWidget(),
        ),
        FFRoute(
          name: LockScannerDetailsWidget.routeName,
          path: LockScannerDetailsWidget.routePath,
          builder: (context, params) => LockScannerDetailsWidget(
            tripId: params.getParam(
              'tripId',
              ParamType.String,
            ),
            barCodeValue: params.getParam(
              'barCodeValue',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: UpdateInfoTripWidget.routeName,
          path: UpdateInfoTripWidget.routePath,
          builder: (context, params) => UpdateInfoTripWidget(
            tripId: params.getParam(
              'tripId',
              ParamType.String,
            ),
            deviceTripData: params.getParam(
              'deviceTripData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: UnlockScreenWidget.routeName,
          path: UnlockScreenWidget.routePath,
          builder: (context, params) => UnlockScreenWidget(
            tripId: params.getParam(
              'tripId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: UnlockScannerDetailsWidget.routeName,
          path: UnlockScannerDetailsWidget.routePath,
          builder: (context, params) => UnlockScannerDetailsWidget(
            tripId: params.getParam(
              'tripId',
              ParamType.String,
            ),
            barCodeValue: params.getParam(
              'barCodeValue',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TripSealListWidget.routeName,
          path: TripSealListWidget.routePath,
          builder: (context, params) => TripSealListWidget(
            tripSealData: params.getParam(
              'tripSealData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: LockedAndUnlockedImagesWidget.routeName,
          path: LockedAndUnlockedImagesWidget.routePath,
          builder: (context, params) => LockedAndUnlockedImagesWidget(
            tripSealData: params.getParam(
              'tripSealData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: TripStatisticsWidget.routeName,
          path: TripStatisticsWidget.routePath,
          builder: (context, params) => TripStatisticsWidget(),
        ),
        FFRoute(
          name: ListViewWidget.routeName,
          path: ListViewWidget.routePath,
          builder: (context, params) => ListViewWidget(
            carListFilterValueParam: params.getParam(
              'carListFilterValueParam',
              ParamType.String,
            ),
            filterValueParam: params.getParam(
              'filterValueParam',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: NewPlaybackWidget.routeName,
          path: NewPlaybackWidget.routePath,
          builder: (context, params) => NewPlaybackWidget(),
        ),
        FFRoute(
          name: PlaybackWidget.routeName,
          path: PlaybackWidget.routePath,
          builder: (context, params) => PlaybackWidget(
            deviceIMEI: params.getParam(
              'deviceIMEI',
              ParamType.String,
            ),
            deviceName: params.getParam(
              'deviceName',
              ParamType.String,
            ),
            deviceData: params.getParam(
              'deviceData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: AlarmWidget.routeName,
          path: AlarmWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Alarm')
              : AlarmWidget(
                  deviceName: params.getParam(
                    'deviceName',
                    ParamType.String,
                  ),
                  eventName: params.getParam(
                    'eventName',
                    ParamType.String,
                  ),
                  eventTime: params.getParam(
                    'eventTime',
                    ParamType.String,
                  ),
                  lat: params.getParam(
                    'lat',
                    ParamType.String,
                  ),
                  lon: params.getParam(
                    'lon',
                    ParamType.String,
                  ),
                  deviceType: params.getParam(
                    'deviceType',
                    ParamType.String,
                  ),
                  deviceImei: params.getParam(
                    'deviceImei',
                    ParamType.String,
                  ),
                ),
        ),
        FFRoute(
          name: AlarmTrackingWidget.routeName,
          path: AlarmTrackingWidget.routePath,
          builder: (context, params) => AlarmTrackingWidget(
            deviceName: params.getParam(
              'deviceName',
              ParamType.String,
            ),
            eventName: params.getParam(
              'eventName',
              ParamType.String,
            ),
            eventTime: params.getParam(
              'eventTime',
              ParamType.String,
            ),
            lat: params.getParam(
              'lat',
              ParamType.String,
            ),
            lon: params.getParam(
              'lon',
              ParamType.String,
            ),
            deviceType: params.getParam(
              'deviceType',
              ParamType.String,
            ),
            deviceData: params.getParam(
              'deviceData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: TripTrackingScreenWidget.routeName,
          path: TripTrackingScreenWidget.routePath,
          builder: (context, params) => TripTrackingScreenWidget(
            tripId: params.getParam(
              'tripId',
              ParamType.String,
            ),
            tripData: params.getParam(
              'tripData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
            name: AddVehicleWidget.routeName,
            path: AddVehicleWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: AddVehicleWidget(
                    deviceImei: params.getParam(
                      'deviceImei',
                      ParamType.String,
                    ),
                    deviceSim: params.getParam(
                      'deviceSim',
                      ParamType.String,
                    ),
                  ),
                )),
        FFRoute(
          name: ScanSimCodeWidget.routeName,
          path: ScanSimCodeWidget.routePath,
          builder: (context, params) => ScanSimCodeWidget(
            tripId: params.getParam(
              'tripId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
            name: FilterAlarmTypeWidget.routeName,
            path: FilterAlarmTypeWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: FilterAlarmTypeWidget(),
                )),
        FFRoute(
          name: AllGroupWidget.routeName,
          path: AllGroupWidget.routePath,
          builder: (context, params) => AllGroupWidget(
            groupData: params.getParam(
              'groupData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: ChangeAccountWidget.routeName,
          path: ChangeAccountWidget.routePath,
          builder: (context, params) => ChangeAccountWidget(),
        ),
        FFRoute(
            name: AddDriverWidget.routeName,
            path: AddDriverWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: AddDriverWidget(),
                )),
        FFRoute(
          name: AllDriverWidget.routeName,
          path: AllDriverWidget.routePath,
          builder: (context, params) => AllDriverWidget(),
        ),
        FFRoute(
          name: ChnageDriverAccountWidget.routeName,
          path: ChnageDriverAccountWidget.routePath,
          builder: (context, params) => ChnageDriverAccountWidget(),
        ),
        FFRoute(
            name: ChangeUserAccountWidget.routeName,
            path: ChangeUserAccountWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: ChangeUserAccountWidget(),
                )),
        FFRoute(
          name: EditUserTripWidget.routeName,
          path: EditUserTripWidget.routePath,
          builder: (context, params) => EditUserTripWidget(
            tripDetails: params.getParam(
              'tripDetails',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: TripUserProfileWidget.routeName,
          path: TripUserProfileWidget.routePath,
          builder: (context, params) => TripUserProfileWidget(),
        ),
        FFRoute(
          name: VsenSplashScreenWidget.routeName,
          path: VsenSplashScreenWidget.routePath,
          builder: (context, params) => VsenSplashScreenWidget(),
        ),
        FFRoute(
          name: SimScanWidget.routeName,
          path: SimScanWidget.routePath,
          builder: (context, params) => SimScanWidget(),
        ),
        FFRoute(
          name: TrackingChangeAccountWidget.routeName,
          path: TrackingChangeAccountWidget.routePath,
          builder: (context, params) => TrackingChangeAccountWidget(),
        ),
        FFRoute(
          name: GeofenceScreenWidget.routeName,
          path: GeofenceScreenWidget.routePath,
          builder: (context, params) => GeofenceScreenWidget(),
        ),
        FFRoute(
          name: SelectGeofenceWidget.routeName,
          path: SelectGeofenceWidget.routePath,
          builder: (context, params) => SelectGeofenceWidget(
            singleGeofenceData: params.getParam(
              'singleGeofenceData',
              ParamType.JSON,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AddGeofenceWidget.routeName,
          path: AddGeofenceWidget.routePath,
          builder: (context, params) => AddGeofenceWidget(),
        ),
        FFRoute(
            name: MoreWidget.routeName,
            path: MoreWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'More')
                : NavBarPage(
                    initialPage: 'More',
                    page: MoreWidget(),
                  )),
        FFRoute(
          name: AccountProfileWidget.routeName,
          path: AccountProfileWidget.routePath,
          builder: (context, params) => AccountProfileWidget(),
        ),
        FFRoute(
            name: NotificationSettingWidget.routeName,
            path: NotificationSettingWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: NotificationSettingWidget(),
                )),
        FFRoute(
            name: AntiTheftNotificationWidget.routeName,
            path: AntiTheftNotificationWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: AntiTheftNotificationWidget(),
                )),
        FFRoute(
          name: TrackingBDWidget.routeName,
          path: TrackingBDWidget.routePath,
          builder: (context, params) => TrackingBDWidget(),
        ),
        FFRoute(
          name: AntiTheftAlarmWidget.routeName,
          path: AntiTheftAlarmWidget.routePath,
          builder: (context, params) => AntiTheftAlarmWidget(),
        ),
        FFRoute(
            name: ReminderNotificationWidget.routeName,
            path: ReminderNotificationWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: ReminderNotificationWidget(),
                )),
        FFRoute(
          name: SupportWidget.routeName,
          path: SupportWidget.routePath,
          builder: (context, params) => SupportWidget(),
        ),
        FFRoute(
          name: TrackingBdTrackingWidget.routeName,
          path: TrackingBdTrackingWidget.routePath,
          builder: (context, params) => TrackingBdTrackingWidget(),
        ),
        FFRoute(
          name: GPSTrackerWidget.routeName,
          path: GPSTrackerWidget.routePath,
          builder: (context, params) => GPSTrackerWidget(),
        ),
        FFRoute(
          name: AllDevicesWidget.routeName,
          path: AllDevicesWidget.routePath,
          builder: (context, params) => AllDevicesWidget(),
        ),
        FFRoute(
          name: GPSTrackimgScreenWidget.routeName,
          path: GPSTrackimgScreenWidget.routePath,
          builder: (context, params) => GPSTrackimgScreenWidget(),
        ),
        FFRoute(
          name: Product6JewelryDetailsWidget.routeName,
          path: Product6JewelryDetailsWidget.routePath,
          builder: (context, params) => Product6JewelryDetailsWidget(),
        ),
        FFRoute(
          name: Details47PropertyListingWidget.routeName,
          path: Details47PropertyListingWidget.routePath,
          builder: (context, params) => Details47PropertyListingWidget(),
        ),
        FFRoute(
          name: Home15TravelWidget.routeName,
          path: Home15TravelWidget.routePath,
          builder: (context, params) => Home15TravelWidget(),
        ),
        FFRoute(
          name: SignUpWidget.routeName,
          path: SignUpWidget.routePath,
          builder: (context, params) => SignUpWidget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: ForgotPasswordWidget.routeName,
          path: ForgotPasswordWidget.routePath,
          builder: (context, params) => ForgotPasswordWidget(),
        ),
        FFRoute(
          name: AddDeviceWidget.routeName,
          path: AddDeviceWidget.routePath,
          builder: (context, params) => AddDeviceWidget(),
        ),
        FFRoute(
            name: ListViewDesignWidget.routeName,
            path: ListViewDesignWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'ListViewDesign')
                : NavBarPage(
                    initialPage: 'ListViewDesign',
                    page: ListViewDesignWidget(
                      carListFilterValueParam: params.getParam(
                        'carListFilterValueParam',
                        ParamType.String,
                      ),
                      filterValueParam: params.getParam(
                        'filterValueParam',
                        ParamType.String,
                      ),
                      playbackDevicedata: params.getParam(
                        'playbackDevicedata',
                        ParamType.JSON,
                      ),
                    ),
                  )),
        FFRoute(
          name: AddSimWidget.routeName,
          path: AddSimWidget.routePath,
          builder: (context, params) => AddSimWidget(
            deviceImei: params.getParam(
              'deviceImei',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DeviceScanWidget.routeName,
          path: DeviceScanWidget.routePath,
          builder: (context, params) => DeviceScanWidget(),
        ),
        FFRoute(
            name: ActivityWidget.routeName,
            path: ActivityWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: ActivityWidget(
                    activtyData: params.getParam(
                      'activtyData',
                      ParamType.JSON,
                    ),
                  ),
                )),
        FFRoute(
            name: DetailsWidget.routeName,
            path: DetailsWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: DetailsWidget(
                    deviceData: params.getParam(
                      'deviceData',
                      ParamType.JSON,
                    ),
                  ),
                )),
        FFRoute(
          name: EditDetailsWidget.routeName,
          path: EditDetailsWidget.routePath,
          builder: (context, params) => EditDetailsWidget(
            deviceData: params.getParam(
              'deviceData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
            name: EditDriverWidget.routeName,
            path: EditDriverWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: EditDriverWidget(),
                )),
        FFRoute(
          name: SubUserWidget.routeName,
          path: SubUserWidget.routePath,
          builder: (context, params) => SubUserWidget(),
        ),
        FFRoute(
            name: EditAllUserWidget.routeName,
            path: EditAllUserWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: EditAllUserWidget(),
                )),
        FFRoute(
            name: AddAllUserWidget.routeName,
            path: AddAllUserWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: AddAllUserWidget(),
                )),
        FFRoute(
          name: POIScreenWidget.routeName,
          path: POIScreenWidget.routePath,
          builder: (context, params) => POIScreenWidget(),
        ),
        FFRoute(
          name: SelectPOIWidget.routeName,
          path: SelectPOIWidget.routePath,
          builder: (context, params) => SelectPOIWidget(
            singleDeviceData: params.getParam(
              'singleDeviceData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: AddPOIWidget.routeName,
          path: AddPOIWidget.routePath,
          builder: (context, params) => AddPOIWidget(),
        ),
        FFRoute(
          name: EditWidget.routeName,
          path: EditWidget.routePath,
          builder: (context, params) => EditWidget(
            singleDeviceData: params.getParam(
              'singleDeviceData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: ChangePasswordWidget.routeName,
          path: ChangePasswordWidget.routePath,
          builder: (context, params) => ChangePasswordWidget(),
        ),
        FFRoute(
          name: AlarmNotificationWidget.routeName,
          path: AlarmNotificationWidget.routePath,
          builder: (context, params) => AlarmNotificationWidget(),
        ),
        FFRoute(
          name: MYDevicesWidget.routeName,
          path: MYDevicesWidget.routePath,
          builder: (context, params) => MYDevicesWidget(),
        ),
        FFRoute(
            name: ListWidget.routeName,
            path: ListWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: ListWidget(
                    carListFilterValueParam: params.getParam(
                      'carListFilterValueParam',
                      ParamType.String,
                    ),
                    filterValueParam: params.getParam(
                      'filterValueParam',
                      ParamType.String,
                    ),
                  ),
                )),
        FFRoute(
          name: DashboardWidget.routeName,
          path: DashboardWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Dashboard')
              : DashboardWidget(),
        ),
        FFRoute(
          name: EditGeofenceWidget.routeName,
          path: EditGeofenceWidget.routePath,
          builder: (context, params) => EditGeofenceWidget(
            geofenceID: params.getParam(
              'geofenceID',
              ParamType.String,
            ),
            geofenceData: params.getParam(
              'geofenceData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: EditPOIWidget.routeName,
          path: EditPOIWidget.routePath,
          builder: (context, params) => EditPOIWidget(
            markerData: params.getParam(
              'markerData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: CarListAlarmWidget.routeName,
          path: CarListAlarmWidget.routePath,
          builder: (context, params) => CarListAlarmWidget(
            deviceName: params.getParam(
              'deviceName',
              ParamType.String,
            ),
            eventName: params.getParam(
              'eventName',
              ParamType.String,
            ),
            eventTime: params.getParam(
              'eventTime',
              ParamType.String,
            ),
            lat: params.getParam(
              'lat',
              ParamType.String,
            ),
            lon: params.getParam(
              'lon',
              ParamType.String,
            ),
            deviceType: params.getParam(
              'deviceType',
              ParamType.String,
            ),
            deviceImei: params.getParam(
              'deviceImei',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: OTPVerificationWidget.routeName,
          path: OTPVerificationWidget.routePath,
          builder: (context, params) => OTPVerificationWidget(
            emailAddress: params.getParam(
              'emailAddress',
              ParamType.String,
            ),
            toklen: params.getParam(
              'toklen',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ResetPasswordWidget.routeName,
          path: ResetPasswordWidget.routePath,
          builder: (context, params) => ResetPasswordWidget(
            token: params.getParam(
              'token',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: Details14DestinationWidget.routeName,
          path: Details14DestinationWidget.routePath,
          builder: (context, params) => Details14DestinationWidget(),
        ),
        FFRoute(
          name: Onboarding03Widget.routeName,
          path: Onboarding03Widget.routePath,
          builder: (context, params) => Onboarding03Widget(),
        ),
        FFRoute(
          name: ReportPdfViewWidget.routeName,
          path: ReportPdfViewWidget.routePath,
          builder: (context, params) => ReportPdfViewWidget(
            pdfData: params.getParam(
              'pdfData',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CommandHistoryWidget.routeName,
          path: CommandHistoryWidget.routePath,
          builder: (context, params) => CommandHistoryWidget(
            deviceData: params.getParam(
              'deviceData',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: ScheduleCommandsWidget.routeName,
          path: ScheduleCommandsWidget.routePath,
          builder: (context, params) => ScheduleCommandsWidget(),
        ),
        FFRoute(
          name: ReportScreenWidget.routeName,
          path: ReportScreenWidget.routePath,
          builder: (context, params) => ReportScreenWidget(),
        ),
        FFRoute(
          name: ScheduleWidget.routeName,
          path: ScheduleWidget.routePath,
          builder: (context, params) => ScheduleWidget(),
        ),
        FFRoute(
          name: ScheduleCommandListWidget.routeName,
          path: ScheduleCommandListWidget.routePath,
          builder: (context, params) => ScheduleCommandListWidget(),
        ),
        FFRoute(
            name: AddSubUserWidget.routeName,
            path: AddSubUserWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: AddSubUserWidget(),
                )),
        FFRoute(
            name: EditSubUserWidget.routeName,
            path: EditSubUserWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: EditSubUserWidget(
                    subUserData: params.getParam(
                      'subUserData',
                      ParamType.JSON,
                    ),
                  ),
                )),
        FFRoute(
            name: UpdateDriverWidget.routeName,
            path: UpdateDriverWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: UpdateDriverWidget(
                    updateDeviceData: params.getParam(
                      'updateDeviceData',
                      ParamType.JSON,
                    ),
                  ),
                )),
        FFRoute(
          name: MyDeviceTestWidget.routeName,
          path: MyDeviceTestWidget.routePath,
          builder: (context, params) => MyDeviceTestWidget(),
        ),
        FFRoute(
          name: RenewListWidget.routeName,
          path: RenewListWidget.routePath,
          builder: (context, params) => RenewListWidget(),
        ),
        FFRoute(
          name: Test1Widget.routeName,
          path: Test1Widget.routePath,
          builder: (context, params) => Test1Widget(),
        ),
        FFRoute(
          name: HistoryDetailsWidget.routeName,
          path: HistoryDetailsWidget.routePath,
          builder: (context, params) => HistoryDetailsWidget(),
        ),
        FFRoute(
            name: AddSubUserCopyWidget.routeName,
            path: AddSubUserCopyWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: AddSubUserCopyWidget(),
                ))
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/vsenSplashScreen';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Image.asset(
                      'assets/images/mr.gps.logo.light_theme.png',
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
