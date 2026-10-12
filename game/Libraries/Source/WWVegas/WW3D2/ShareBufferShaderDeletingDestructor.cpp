// cl: /DNDEBUG /MD /EHsc

class ShaderClass;

class RefCountClass
{
public:
	virtual void Delete_This();
protected:
	virtual ~RefCountClass() {}
private:
	int NumRefs;
};
template <class T> class ShareBufferClass : public RefCountClass
{
public:
	virtual ~ShareBufferClass();
protected:
	T *RawBuffer;		// +0x08
	T *Array;			// +0x0C
};

// Retail 0x0092B920: 29 bytes, unconditional delete[] with no EH frame.
void operator delete[](void *block) throw();
template <class T> __declspec(noinline) ShareBufferClass<T>::~ShareBufferClass()
{
	delete[] RawBuffer;
}

template class ShareBufferClass<ShaderClass>;

void Force_ShareBufferShader_Deleting_Destructor(ShareBufferClass<ShaderClass> *buffer)
{
	delete buffer;
}
