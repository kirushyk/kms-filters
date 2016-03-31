/* Autogenerated with kurento-module-creator */

#ifndef __GSTREAMER_FILTER_IMPL_FACTORY_HPP__
#define __GSTREAMER_FILTER_IMPL_FACTORY_HPP__

#include "GStreamerFilterImpl.hpp"
#include "FilterImplFactory.hpp"
#include <MediaObjectImpl.hpp>
#include <boost/property_tree/ptree.hpp>

namespace kurento
{

class GStreamerFilterImplFactory : public virtual FilterImplFactory
{
public:
  GStreamerFilterImplFactory () {};

  virtual std::string getName () const {
    return "GStreamerFilter";
  };

private:

  virtual MediaObjectImpl *createObjectPointer (const boost::property_tree::ptree &conf, const Json::Value &params) const;

  MediaObjectImpl *createObject (const boost::property_tree::ptree &conf, std::shared_ptr<MediaPipeline> mediaPipeline, const std::string &command, std::shared_ptr<FilterType> filterType) const;
};

} /* kurento */

#endif /*  __GSTREAMER_FILTER_IMPL_FACTORY_HPP__ */