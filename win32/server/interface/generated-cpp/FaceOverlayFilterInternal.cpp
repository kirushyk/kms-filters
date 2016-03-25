/* Autogenerated with kurento-module-creator */

#include <iostream>
#include "FaceOverlayFilterInternal.hpp"
#include <KurentoException.hpp>
#include <jsonrpc/JsonSerializer.hpp>
#include "MediaPipeline.hpp"

namespace kurento
{

void FaceOverlayFilterMethodUnsetOverlayedImage::invoke (std::shared_ptr<FaceOverlayFilter> obj)
{
  if (!obj) {
    throw KurentoException (MEDIA_OBJECT_NOT_FOUND, "Invalid object while invoking method FaceOverlayFilter::unsetOverlayedImage");
  }

  return obj->unsetOverlayedImage ();
}

void FaceOverlayFilterMethodUnsetOverlayedImage::Serialize (kurento::JsonSerializer &s)
{
  if (s.IsWriter) {
  } else {
    if (!s.JsonValue.isNull () && !s.JsonValue.isObject ()) {
      throw KurentoException (MARSHALL_ERROR,
                              "'operationParams' should be an object");
    }

  }
}

void FaceOverlayFilterMethodSetOverlayedImage::invoke (std::shared_ptr<FaceOverlayFilter> obj)
{
  if (!obj) {
    throw KurentoException (MEDIA_OBJECT_NOT_FOUND, "Invalid object while invoking method FaceOverlayFilter::setOverlayedImage");
  }

  return obj->setOverlayedImage (uri, offsetXPercent, offsetYPercent, widthPercent, heightPercent);
}

void FaceOverlayFilterMethodSetOverlayedImage::Serialize (kurento::JsonSerializer &s)
{
  if (s.IsWriter) {
    s.SerializeNVP (uri);

    s.SerializeNVP (offsetXPercent);

    s.SerializeNVP (offsetYPercent);

    s.SerializeNVP (widthPercent);

    s.SerializeNVP (heightPercent);

  } else {
    if (s.JsonValue.isNull ()) {
      throw KurentoException (MARSHALL_ERROR,
                              "'operationParams' is required");
    } else if (!s.JsonValue.isObject ()){
      throw KurentoException (MARSHALL_ERROR,
                              "'operationParams' should be an object");
    }

    if (!s.JsonValue.isMember ("uri") || !s.JsonValue["uri"].isConvertibleTo (Json::ValueType::stringValue) ) {
      throw KurentoException (MARSHALL_ERROR,
                              "'uri' parameter should be a string");
    }

    s.SerializeNVP (uri);

    if (!s.JsonValue.isMember ("offsetXPercent") || !s.JsonValue["offsetXPercent"].isConvertibleTo (Json::ValueType::realValue) ) {
      throw KurentoException (MARSHALL_ERROR,
                              "'offsetXPercent' parameter should be a double");
    }

    s.SerializeNVP (offsetXPercent);

    if (!s.JsonValue.isMember ("offsetYPercent") || !s.JsonValue["offsetYPercent"].isConvertibleTo (Json::ValueType::realValue) ) {
      throw KurentoException (MARSHALL_ERROR,
                              "'offsetYPercent' parameter should be a double");
    }

    s.SerializeNVP (offsetYPercent);

    if (!s.JsonValue.isMember ("widthPercent") || !s.JsonValue["widthPercent"].isConvertibleTo (Json::ValueType::realValue) ) {
      throw KurentoException (MARSHALL_ERROR,
                              "'widthPercent' parameter should be a double");
    }

    s.SerializeNVP (widthPercent);

    if (!s.JsonValue.isMember ("heightPercent") || !s.JsonValue["heightPercent"].isConvertibleTo (Json::ValueType::realValue) ) {
      throw KurentoException (MARSHALL_ERROR,
                              "'heightPercent' parameter should be a double");
    }

    s.SerializeNVP (heightPercent);

  }
}

std::shared_ptr<MediaPipeline> FaceOverlayFilterConstructor::getMediaPipeline ()
{
  return mediaPipeline;
}

void FaceOverlayFilterConstructor::Serialize (kurento::JsonSerializer &s)
{
  if (s.IsWriter) {
    s.SerializeNVP (mediaPipeline);

  } else {
    if (s.JsonValue.isNull ()) {
      throw KurentoException (MARSHALL_ERROR,
                              "'constructorParams' is required");
    } else if (!s.JsonValue.isObject ()){
      throw KurentoException (MARSHALL_ERROR,
                              "'constructorParams' should be an object");
    }

    if (!s.JsonValue.isMember ("mediaPipeline") || !s.JsonValue["mediaPipeline"].isConvertibleTo (Json::ValueType::stringValue) ) {
      throw KurentoException (MARSHALL_ERROR,
                              "'mediaPipeline' parameter should be a string");
    }

    s.SerializeNVP (mediaPipeline);

  }
}

} /* kurento */
