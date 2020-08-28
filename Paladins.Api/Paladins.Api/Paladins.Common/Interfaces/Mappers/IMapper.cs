namespace Paladins.Common.Interfaces.Mappers
{
    public interface IMapper<TFrom, TDestination>
    {
        TDestination Map(TFrom from);
    }
}
